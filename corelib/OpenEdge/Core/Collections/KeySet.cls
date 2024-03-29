/************************************************
Copyright (c) 2012, 2020, 2023 by Progress Software Corporation. All rights reserved.
*************************************************/ 
/*------------------------------------------------------------------------
    File        : KeySet
    Purpose     :
    Description : 
    Author(s)   : hdaniels
    Created     : apr 2010
    Notes       : DEPRECATED: Uses the MapBackedCollection which used a temp-table
                  to store the name-value pairs. Instead, use another ISet class
                  such as OE.Core.Collections.Set.

                  No empty constructor, specialized for KeySet of IMap 
                  - Changes to the map are reflected here, and vice-versa. 
                  - Supports removal and removes the corresponding map entry from the map
                    (Iterator.remove, Collection.remove, removeAll, retainAll and clear) .
                  - Do not support add and addAll.   
                  - no empty constructor, specialised for IMap 
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using OpenEdge.Core.Collections.ICollection.
using OpenEdge.Core.Collections.IMap. 
using OpenEdge.Core.Collections.IIterator. 
using OpenEdge.Core.Collections.ISet. 
using OpenEdge.Core.Collections.KeySet. 
using OpenEdge.Core.Collections.MapBackedCollection. 
using Progress.Lang.Object.

@deprecated(from='12.8.0', reason='Use OpenEdge.Core.Collections.Set').
class OpenEdge.Core.Collections.KeySet
serializable
inherits MapBackedCollection
implements ISet: 
    
    /* Constructor
       
       @param IMap The owning map
       @param handle The underlying TT holding the data
       @param character (optional) Query string 
       @param character The field holding the data in the TT */
    constructor public KeySet(input pMap as IMap,
                              input pTT as handle,
                              input pQueryString as character,
                              input pValueField as character):
        super(pMap, pTT, pQueryString, pValueField).
    end constructor.
  
    constructor public KeySet (poMap as IMap,phTT as handle,pcKeyField as char):
        super (poMap,phTT,pcKeyField).        
    end constructor.
    
    method public override logical Contains(poObj as Object):        
         return OwningMap:ContainsKey(poObj).
    end method.
   
    method override public logical ContainsAll(collection as ICollection):
        return OwningMap:ContainsAllKeys(collection).
    end method.
    
    /* Equals if Set and every member of the specified set is contained in this set */
    method public override logical Equals(o as Object):
        define variable oSet as ISet no-undo.
        define variable oIter as IIterator no-undo.
        if super:Equals(o) then 
            return true.
        if type-of(o,ISet) then
        do:
            oSet = cast(o,ISet).
            if oSet:Size = Size then
            do:
                oIter = Iterator().
                do while oIter:HasNext():
                    if oSet:Contains(oIter:Next()) = false then
                        return false. 
                end.    
                return true.
            end.    
        end.
        return false.    
    end method.   
     
    method public override logical Remove(poOld as Object ):
        define variable i as integer no-undo.
         /* OwningMap:Remove() returns oldvalue, but it could be unknown, so use size to check if deleted */
         i = Size.
         OwningMap:Remove(poOld).
         if i > Size then 
             return true.
         return false.    
    end method.
    
    method public override logical RemoveAll(collection as ICollection):
        define variable iterator   as IIterator no-undo.         
        define variable anyRemoved as logical no-undo.
        iterator = collection:Iterator().
        do while iterator:HasNext():
            if Remove(iterator:Next()) then 
                anyRemoved = true. 
        end.
        return anyRemoved.
    end method.
    
    method public override logical RetainAll(collection as ICollection):
        define variable iterator   as IIterator no-undo.    
        define variable oObj      as Object no-undo.     
        define variable anyRemoved as logical no-undo.
        iterator = collection:Iterator().
        do while iterator:HasNext():
            oObj = iterator:Next().
            if not Contains(oObj) then
            do:
                Remove(oObj). 
                anyRemoved = true. 
            end.
        end.
        return anyRemoved.
    end method.
     
end class.
