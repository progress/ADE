/*E4GL-W*/ {src/web/method/e4gl.i} {&OUT} '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">~n'.
{&OUT} '<!--------------------------------------------------------------------~n'.
{&OUT} '* Copyright (C) 2000 by Progress Software Corporation. All rights    *~n'.
{&OUT} '* reserved. Prior versions of this work may contain portions         *~n'.
{&OUT} '* contributed by participants of Possenet.                           *~n'.
{&OUT} '*                                                                    *~n'.
{&OUT} '--------------------------------------------------------------------->~n'.
{&OUT} '<HTML>~n'.
{&OUT} '<HEAD>~n'.
{&OUT} '<META NAME="author" CONTENT="Douglas M. Adams"> ~n'.
{&OUT} '<META NAME="wsoptions" CONTENT="compile"> ~n'.
{&OUT} '<TITLE>Print</TITLE>~n'.
{&OUT} '</HEAD>~n'.

{&OUT} '<BODY onLoad="window.print()~; window.close()">~n'.
{&OUT} '<SCRIPT LANGUAGE="JavaScript1.2"><!--~n'.
{&OUT} '  document.write(''<PLAINTEXT>'' + opener.getField("txt", "value"))~;~n'.
{&OUT} '  document.close()~;~n'.
{&OUT} '//--></SCRIPT>~n'.
{&OUT} '</BODY>~n'.

{&OUT} '</HTML>~n'.
/************************* END OF HTML *************************/
/*
** File: src/main/abl/webutil/_prnwin.w
** Generated on: 2021-03-15 16:17:37
** By: WebSpeed Embedded SpeedScript Preprocessor
** Version: 2
** Source file: src/main/abl/webutil/_prnwin.html
** Options: compile,wsoptions-found,web-object
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
    INITIAL "compile,wsoptions-found,web-object":U.
  DEFINE OUTPUT PARAMETER p_content-type AS CHARACTER NO-UNDO
    INITIAL "text/html":U.
END PROCEDURE.

/* end */
