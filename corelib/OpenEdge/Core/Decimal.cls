/************************************************
Copyright (c) 2016, 2019, 2022-2023 by Progress Software Corporation. All rights reserved.
*************************************************/
/*------------------------------------------------------------------------
    File        : Decimal
    Purpose     : Holds (wraps) an ABL primitive DECIMAL value.
    Syntax      :
    Description :
    Author(s)   : pjudge
    Created     : Mon Jun 06 12:27:33 EDT 2016
    Notes       : * The wrapped value is immutable
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Ccs.Common.Support.IDecimalHolder.
using OpenEdge.Core.Assert.
using Progress.Collections.IComparable.
using Progress.Collections.IHashable.

class OpenEdge.Core.Decimal
implements IDecimalHolder
           // Compare to the interface so that other implementations of IDecimalHolder can be sorted with this one
         , IComparable<IDecimalHolder>
         , IHashable
:

    /* The primitive ABL value */
    define public property Value as decimal no-undo get.
        private set. // The wrapped value is immutable

    /* Constructor.
       
       @param decimal The wrapped value. */
    constructor public Decimal (input pdVal as decimal):
        assign this-object:Value = pdVal.
    end constructor.
    
    method override public character ToString ():
        return string(this-object:Value).
    end method.
    
    method override public logical Equals (input PO as Progress.Lang.Object):
        define variable ocDec as OpenEdge.Core.Decimal no-undo.
        define variable valCompare as decimal no-undo.

        if super:Equals(PO) then
            return true.

        if type-of(PO, OpenEdge.Core.Decimal) then
        do:
            ocDec = cast(PO, OpenEdge.Core.Decimal).
            return this-object:Value eq ocDec:Value.
        end.
        else if type-of(PO, IDecimalHolder) then
        do:
            valCompare = dynamic-property(PO, 'Value').
            If this-object:Value eq valCompare then
                return true.
        end.

        return false.
    end method.
    
    /* Comparison method, used by SortedSet's default comparer
        
        - If the returned value is less than 0 (zero), then the current object sorts before the object passed in.
        - If the returned value equals 0 (zero) , then the current object occupies the same position in the sort order.
        - If the returned value is greater than 0(zero), then the current object sorts after the object passed in.
        - If either object's Value is the unknown value (?), then that sorts high/early/before
        
        @param IDecimalHolder The object to compare to.
        @return integer  0 = same object
                        +1 = sorts after
                        -1 = sorts before   */
    method public integer CompareTo (input pOther as IDecimalHolder):
        Assert:NotNull(pOther, 'CompareTo object').
        
        if this-object:Value eq pOther:Value then
            return 0.

        // unknown values sort first/lower
        if this-object:Value gt pOther:Value
        or pOther:Value eq ?
        then
            return +1.
        else
        if this-object:Value lt pOther:Value
        or this-object:Value eq ?
        then
            return -1.
        
        // this will raise an error in the Comparer; we should never get here though.
        return ?.
    end method.

    /* Hashing method for creating a proper index for use with Progress.Collections.HashMap

        @return integer Result of the hash-code method using this object's comparable value(s) */
    method public integer HashCode ( ):
        // In order to create a meaningful hash for an object instance,
        // we should follow suite with how the Equals() logic works.
        // By using the full class name plus the object's comparable value(s)
        // this should be consistent for any instance of this object type.
        return hash-code(this-object:GetClass():TypeName, this-object:Value).
    end method.

end class.
