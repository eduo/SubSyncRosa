#tag ClassProtected Class subClass	#tag Method, Flags = &h0		Function count() As integer		  return sublines.Ubound +1		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function duration() As double		  if subLines.Ubound > -1 then		    		    dim fullDuration as double		    		    fullDuration = subLines(sublines.Ubound).startSeconds + subLines(sublines.Ubound).durationSeconds		    		  else		    return 0		  end if		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub order()		  dim times() as double		  		  for i as integer = 0 to sublines.Ubound		    		    times.Append sublines(i).startSeconds		    		  next		  		  times.SortWith(subLines)		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub processSubFile(thisSub as FolderItem)		  Dim subTextStream As TextInputStream 		  		  dim t as BinaryStream		  		  subTextStream = TextInputStream.Open(thisSub)		  t = BinaryStream.Open(thisSub)		  		  Dim subText() As String		  		  if Encoding is nil then		    dim s as string		    s = t.Read(t.Length)		    subOriginalContents = s		    encoding = StringUtils.GuessEncoding(s)		  end if		  		  subTextStream.PositionB = 0		  'text = t.ReadAll(encoding)		  		  do		    dim thisTempText as string = subTextStream.ReadLine(encoding).ConvertEncoding(encodings.UTF8)		    subText.Append(thisTempText)		  loop until subTextStream.EOF		  		  If subText.Ubound = -1 Then exit sub		  'Return Nil		  		  Dim thisSubClass As subClass = self		  thisSubClass.subFile = thisSub		  Dim i As Integer = 0		  		  redim sublines(-1)		  		  While i <= subText.Ubound		    Dim thisLine As String = subtext(i)		    if thisLine.len = 0 then		      i = i+1		       continue		    end if		    if IsNumeric(thisLine) and thisLine.InStr(",") = 0 and thisLine.InStr(".") = 0 then		      dim thisSubLine as new subLine		      		      thisSubLine.lineID = thisLine.Val		      dim sep as string = "-->"		      i = i+1		      thisLine = subText(i)		      if thisLine.Len = 0 then 		        thisSubLine = nil		        exit while		      end if		      dim thisTime1 as string = thisLine.NthField(sep,1).Trim		      thisSubLine.startTime = thisTime1		      thisSubLine.startSeconds = timeStringToSeconds(thisTime1)		      		      dim thisTime2 as string = thisLine.NthField(sep,2).Trim		      thisSubLine.endTime = thisTime2		      thisSubLine.endSeconds = timeStringToSeconds(thisTime2)		      dim timeGap as double		      timeGap = thisSubLine.endSeconds - thisSubLine.startSeconds		      		      thisSubLine.durationSeconds = timeGap		      		      dim keepParsing as boolean = true		      while keepParsing		        if i = subText.Ubound then exit while		        i = i+1		        thisLine = subText(i)		        if thisLine.Len = 0 then		          keepParsing = false		        elseif IsNumeric(thisLine) and thisLine.InStr(",") = 0 and thisLine.InStr(".") = 0 then		          thisSubLine = nil		          keepParsing = false		          i = i-1		        else		          thisSubLine.subText.Append thisLine		        end if		      wend		      		      if thisSubLine <> nil then		        if thisSubLine.subText.Ubound > -1 then		          thisSubClass.subLines.Append(thisSubLine)		        end if		      end if		    end if		    		    'MsgBox subText(i)		    i = i+1		  Wend		  		  'return thisSubClass		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub updateAllTimings(startLine as integer,startSeconds as double,endLine as integer,endSeconds as double,shift as double, optional allLines as boolean)		  dim origStartSeconds,origEndSeconds as double		  origStartSeconds = me.subLines(startLine-1).startSeconds		  origEndSeconds = me.subLines(endLine-1).startSeconds		  		  dim m,b as double		  		  m = (endSeconds-startSeconds)/(origEndSeconds-origStartSeconds)		  b = startSeconds-m*(origStartSeconds)		  		  log("m is "+str(m)+ " y b is "+str(b))		  		  dim first,last as integer		  		  if allLines then first = 0 else first = startLine-1		  if allLines then last = subLines.Ubound else last = endLine -1		  		  for i as integer = first to last		    dim sl as subLine		    		    sl = sublines(i)		    dim starts,newstarts, ends,newends, newdurations,thisdurations as double		    dim start, endt as string		    		    starts = sl.startSeconds		    ends = sl.endSeconds		    thisdurations = sl.durationSeconds		    		    newstarts = m*(starts)+b		    if newstarts < 0 then 		      newstarts = starts		      newends = ends		    else		      newends = m*(ends)+b		    end if		    		    newdurations = newends-newstarts		    start = secondsToTimestring(newstarts)		    endt = secondsToTimestring(newends)		    		    sl.startSeconds = newstarts		    sl.endSeconds = newends		    sl.durationSeconds = newdurations		    sl.startTime = start		    sl.endTime = endt		    log("Test")		    		  next		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub updateAllTimings1(startLine as integer,startSeconds as double,endLine as integer,endSeconds as double,shift as double, optional allLines as boolean)		  dim origStartSeconds,origEndSeconds as double		  origStartSeconds = me.subLines(startLine-1).startSeconds		  origEndSeconds = me.subLines(endLine-1).startSeconds		  		  dim factor as double 		  factor = (origEndSeconds-origStartSeconds)/(endSeconds-startSeconds)		  factor = origEndSeconds/(endSeconds+shift)		  		  log("Factor is "+str(factor))		  		  dim first,last as integer		  		  if allLines then first = 0 else first = startLine-1		  if allLines then last = subLines.Ubound else last = endLine -1		  		  for i as integer = first to last		    dim sl as subLine		    		    sl = sublines(i)		    dim starts, ends, durations as double		    dim start, endt as string		    		    'sl.startSeconds = sl.startSeconds+((sl.startSeconds-origStartSeconds)/factor) + shift		    'sl.endSeconds = sl.endSeconds+((sl.startSeconds-origStartSeconds)/factor) + shift		    'sl.durationSeconds = sl.durationSeconds/factor		    		    starts = (sl.startSeconds+shift)*factor		    ends = (sl.startSeconds+ shift)*factor		    durations = sl.durationSeconds*factor		    start = secondsToTimestring(sl.startSeconds)		    endt = secondsToTimestring(sl.endSeconds)		    		    sl.startSeconds = starts		    sl.endSeconds = ends		    		    sl.durationSeconds = durations		    sl.startTime = start		    sl.endTime = endt		    log("Test")		    		  next		End Sub	#tag EndMethod	#tag Property, Flags = &h0		encoding As TextEncoding	#tag EndProperty	#tag Property, Flags = &h0		subContents As string	#tag EndProperty	#tag Property, Flags = &h0		subFile As folderitem	#tag EndProperty	#tag Property, Flags = &h0		subLines() As subLine	#tag EndProperty	#tag Property, Flags = &h0		subOriginalContents As string	#tag EndProperty	#tag ViewBehavior		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			Type="Integer"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			Type="String"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="subContents"			Group="Behavior"			Type="string"			EditorType="MultiLineEditor"		#tag EndViewProperty		#tag ViewProperty			Name="subOriginalContents"			Group="Behavior"			Type="string"			EditorType="MultiLineEditor"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			Type="String"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass