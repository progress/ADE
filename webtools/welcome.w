/*E4GL-W*/ {src/web/method/e4gl.i} {&OUT} '<HTML>~n'.
{&OUT} '<HEAD>~n'.
{&OUT} '<TITLE>Welcome to WebSpeed Workshop</TITLE>~n'.
{&OUT} '</HEAD>~n'.
{&OUT} '<BODY BACKGROUND="' /*Tag=`*/ RootURL /*Tag=`*/ '/images/bgr/wsbgr.gif" TEXT="#000000">~n'.
{&OUT} '<CENTER>~n'.
{&OUT} '</CENTER>~n'.
{&OUT} '</BODY>~n'.
{&OUT} '</HTML>~n'.
/************************* END OF HTML *************************/
/*
** File: src/main/abl/webtools/welcome.w
** Generated on: 2021-03-15 16:17:37
** By: WebSpeed Embedded SpeedScript Preprocessor
** Version: 2
** Source file: src/main/abl/webtools/welcome.html
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
