#tag Class
Protected Class ReddiDesk
Inherits HTTPSocket
	#tag Event
		Sub DownloadComplete(url as string, httpStatus as integer, headers as internetHeaders, file as folderItem)
		  System.DebugLog(url)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(code as integer)
		  System.DebugLog str(code)
		End Sub
	#tag EndEvent

	#tag Event
		Sub HeadersReceived(headers as internetHeaders, httpStatus as integer)
		  System.DebugLog "Status: " + str(httpStatus)
		  System.DebugLog headers.Source
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub PageReceived(url as string, httpStatus as integer, headers as internetHeaders, content as string)
		  
		  me.FillUserStructure(content)
		  
		  me.DataValid = True
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ReceiveProgress(bytesReceived as integer, totalBytes as integer, newData as string)
		  System.DebugLog(str(bytesReceived) + " - " + str(totalBytes) + " -- " + newData)
		End Sub
	#tag EndEvent


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
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetUserInfo(Username As String)
		  If len(Username) <= 0 Then 
		    Return
		  end If
		  
		  me.DataValid = False  ' Invalidate data
		  
		  me.Yield = True
		  me.SetRequestHeader("User-Agent:", cUserAgent)
		  
		  me.Get(cBaseURL + "/user/" + Username + "/me.json")
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrentUserInfo As sUserInfo
	#tag EndProperty

	#tag Property, Flags = &h0
		DataValid As Boolean = False
	#tag EndProperty


	#tag Constant, Name = cBaseURL, Type = String, Dynamic = False, Default = \"http://www.reddit.com", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cUserAgent, Type = String, Dynamic = False, Default = \"ReddiDesk/0.0.1 by t0mt0m72", Scope = Public
	#tag EndConstant


	#tag Structure, Name = sUserInfo, Flags = &h0
		LastUpdate as Double
		  Name as String * 64
		LinkKarma as Integer
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesAvailable"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesLeftToSend"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataValid"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Handle"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="httpProxyAddress"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="httpProxyPort"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsConnected"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastErrorCode"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LocalAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoteAddress"
			Group="Behavior"
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
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="yield"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
