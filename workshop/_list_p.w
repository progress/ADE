/*E4GL-W*/ {src/web/method/e4gl.i} {&OUT} '<HTML>~n'.
{&OUT} '<HEAD>~n'.
{&OUT} '<TITLE>Dump _P Records</TITLE>~n'.
{&OUT} '</HEAD>~n'.
{&OUT} '<BODY>~n'.
{&OUT} '<CENTER>~n'.
{&OUT} '<H1>Dump _P records:</H1>~n'.
{&OUT} '<H2>for ' /*Tag=`*/  WEB-CONTEXT:EXCLUSIVE-ID /*Tag=`*/ '</H2>~n'.
{&OUT} 'This is a debugging screen. If you see it, please call bill wood (x4528).~n'.
{&OUT} '</CENTER>~n'.
 /*Tag=<SCRIPT LANGUAGE="PROGRESS">*/ 
  {workshop/sharvars.i }
  {workshop/code.i }
  {workshop/objects.i }
  {workshop/uniwidg.i }
  {workshop/htmwidg.i }
  OUTPUT TO "WEB":U.
  FOR EACH _P:
    DISPLAY RECID(_P) _P._filename FORMAT "X(25)" _P._open _P._modified.
  END.  

  FOR EACH _code BY _code._p-recid:
    DISPLAY RECID(_code) LABEL "RECID(_code)" 
            _code._P-recid LABEL "_P-recid" 
            _code._prev-id LABEL "Prev-id"
            _code._next-id LABEL "Next-id"
            _code._section LABEL "Section"
            _code._name FORMAT "X(20)"
            _code._special FORMAT "X(15)"
            WITH WIDTH 120.
  END.

  FOR EACH _U BY _U._p-recid:
    DISPLAY RECID(_U) LABEL "RECID(_U)" _U._P-recid LABEL "RECID(_P)" 
            _U._x-recid LABEL "x-recid" _U._parent-recid  LABEL "parent"
            _U._NAME FORMAT "X(24)" _U._TYPE
            WITH WIDTH 120.
  END.

  FOR EACH _HTM BY _HTM._i-order:
    DISPLAY RECID(_HTM) LABEL "RECID(_HTM)" 
            _HTM._U-recid _HTM._P-recid 
            _HTM._HTM-NAME FORMAT "X(24)" _HTM._HTM-Tag _HTM._HTM-TYPE _HTM._MDT-TYPE
            WITH WIDTH 120.

  END.

 /*Tag=</SCRIPT>*/ 
{&OUT} '</BODY>~n'.
{&OUT} '</HTML>~n'.



/************************* END OF HTML *************************/
/*
** File: src/main/abl/workshop/_list_p.w
** Generated on: 2021-03-15 16:17:37
** By: WebSpeed Embedded SpeedScript Preprocessor
** Version: 2
** Source file: src/main/abl/workshop/_list_p.html
** Options: web-object
**
** WARNING: DO NOT EDIT THIS FILE.  Make changes to the original
** HTML file and regenerate this file from it.
**
*/
/********************* Internal Definitions ********************/

/* This procedure returns the generation options at runtime.
   It is invoked by src/web/method/e4gl.i included at the start
   of this file. */
PROCEDURE local-e4gl-options :
  DEFINE OUTPUT PARAMETER p_version AS DECIMAL NO-UNDO
    INITIAL 2.0.
  DEFINE OUTPUT PARAMETER p_options AS CHARACTER NO-UNDO
    INITIAL "web-object":U.
  DEFINE OUTPUT PARAMETER p_content-type AS CHARACTER NO-UNDO
    INITIAL "text/html":U.
END PROCEDURE.

/* end */