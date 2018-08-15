#tag ClassProtected Class SubSyncRosaInherits Application	#tag Event		Sub NewDocument()		  Carbon._TestSelf		  'CoreFoundation._TestSelf		  ATSForFonts.ATSFont.SelfTest		  CertTools.SelfTest		  'TestFileManager		  'TestBundleLookup		  'TestCocoa		End Sub	#tag EndEvent	#tag Event		Sub Open()		  Cocoa.Initialize		  		  		End Sub	#tag EndEvent	#tag Event		Sub OpenDocument(item As FolderItem)		  		  if item <> nil and item.Exists and item.IsReadable then		  else		    exit sub		  end if		  		  if item is nil then exit sub		  		  if item.name.right(4) <> ".srt" then exit sub		  		  dim w as new subWindow		  Dim mySub As subclass		  mySub = New subClass		  mySub.processSubFile(item)		  w.mainSubList.mySub = mySub		  		  w.Title =item.Name +  " - "+ app.AppName		  w.DocumentFile = item		  		End Sub	#tag EndEvent	#tag Method, Flags = &h21		Private Sub HandleOpen(items() as FolderItem)		  dim paths() as String		  for i as Integer = 0 to UBound(items)		    paths.Append items(i).POSIXPath		  next		  		  if UBound(paths) > -1 then		    Msgbox Join(paths, EndOfLine)		  else		    MsgBox "No items opened."		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function NSApplication() As Ptr		  #if targetCocoa		    soft declare function NSClassFromString lib CocoaLib (aClassName as CFStringRef) as Ptr		    soft declare function sharedApplication lib CocoaLib selector "sharedApplication" (class_id as Ptr) as Ptr		    		    return sharedApplication(NSClassFromString("NSApplication"))		  #endif		End Function	#tag EndMethod	#tag Constant, Name = appName, Type = String, Dynamic = False, Default = \"SubSyncRosa", Scope = Public	#tag EndConstant	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"	#tag EndConstant	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"	#tag EndConstant	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"	#tag EndConstant	#tag ViewBehavior	#tag EndViewBehaviorEnd Class#tag EndClass