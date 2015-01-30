#tag Class
Protected Class ReddiDeskUsers
	#tag Method, Flags = &h21
		Private Sub FillUserStructure(UserInfo as String)
		  Dim base_item as new JSONItem(UserInfo)
		  Dim detail_item as JSONItem
		  
		  dim ii() as String
		  
		  ii() = base_item.Names
		  
		  detail_item = base_item.Child("data")
		  
		  CurrentUserInfo.Name = detail_item.Lookup("name", "")
		  
		  dim dd as new Date
		  CurrentUserInfo.LastUpdate = dd.TotalSeconds
		  
		  CurrentUserInfo.LinkKarma = detail_item.Lookup("link_karma", 0)
		  CurrentUserInfo.CommentKarma = detail_item.Lookup("comment_karma", 0)
		  
		  CurrentUserInfo.isGold = detail_item.Lookup("is_gold", False)
		  CurrentUserInfo.isMod = detail_item.Lookup("is_mod", False)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetUserInfo(Username As String)
		  If len(Username) <= 0 Then
		    Return
		  end If
		  
		  me.DataValid = False  ' Invalidate data
		  
		  
		  Dim va as String
		  ' va = me.Get(cBaseURL + "/user/" + Username + "/about.json", 0)
		  ' 
		  ' if me.HTTPStatusCode = 200 Then
		  ' me.FillUserStructure(va)
		  ' Else
		  ' Raise new ReddiDeskException(me.HttpStatusCode)
		  ' End If
		  ' 
		  ' System.DebugLog str(me.HTTPStatusCode)
		  System.DebugLog va
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrentUserInfo As sUserInfo
	#tag EndProperty

	#tag Property, Flags = &h0
		DataValid As Boolean = False
	#tag EndProperty


	#tag Structure, Name = sUserInfo, Flags = &h0
		LastUpdate as Double
		  Name as String * 64
		  LinkKarma as Integer
		  CommentKarma as integer
		  isGold as Boolean
		isMod as Boolean
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="DataValid"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
