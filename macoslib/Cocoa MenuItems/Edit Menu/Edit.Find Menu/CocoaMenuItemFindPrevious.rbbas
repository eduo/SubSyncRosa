#tag ClassProtected Class CocoaMenuItemFindPreviousInherits CocoaMenuItemFindAbstract	#tag Event		Function CocoaTag() As Integer		  const NSFindPanelActionPrevious = 3		  		  return NSFindPanelActionPrevious		End Function	#tag EndEvent	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Find Previous", Scope = Public		#Tag Instance, Platform = Any, Language = en, Definition  = \"Find Previous"		#Tag Instance, Platform = Any, Language = de, Definition  = \"Weitersuchen (r\xC3\xBCckw\xC3\xA4rts)"		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE5\x89\x8D\xE3\x82\x92\xE6\xA4\x9C\xE7\xB4\xA2"		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Rechercher le pr\xC3\xA9c\xC3\xA9dent"		#Tag Instance, Platform = Any, Language = it, Definition  = \"Cerca precedente"	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="AutoEnable"			Group="Behavior"			InitialValue="0"			Type="Boolean"			InheritedFrom="CocoaMenuItemFindAbstract"		#tag EndViewProperty		#tag ViewProperty			Name="Checked"			Group="Behavior"			InitialValue="0"			Type="Boolean"			InheritedFrom="CocoaMenuItemFindAbstract"		#tag EndViewProperty		#tag ViewProperty			Name="CommandKey"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="CocoaMenuItemFindAbstract"		#tag EndViewProperty		#tag ViewProperty			Name="Enabled"			Group="Behavior"			InitialValue="0"			Type="Boolean"			InheritedFrom="CocoaMenuItemFindAbstract"		#tag EndViewProperty		#tag ViewProperty			Name="Icon"			Group="Behavior"			InitialValue="0"			Type="Picture"			InheritedFrom="CocoaMenuItemFindAbstract"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			Type="Integer"			InheritedFrom="CocoaMenuItemFindAbstract"		#tag EndViewProperty		#tag ViewProperty			Name="KeyboardShortcut"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="CocoaMenuItemFindAbstract"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="CocoaMenuItemFindAbstract"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			Type="String"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Text"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="CocoaMenuItemFindAbstract"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Visible"			Group="Behavior"			InitialValue="0"			Type="Boolean"			InheritedFrom="CocoaMenuItemFindAbstract"		#tag EndViewProperty		#tag ViewProperty			Name="_mIndex"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="CocoaMenuItemFindAbstract"		#tag EndViewProperty		#tag ViewProperty			Name="_mName"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="CocoaMenuItemFindAbstract"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass