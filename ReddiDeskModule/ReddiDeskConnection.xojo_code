#tag Class
Protected Class ReddiDeskConnection
Inherits HTTPSecureSocket
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From HTTPSecureSocket
		  // Constructor() -- From TCPSocket
		  // Constructor() -- From SocketCore
		  Super.Constructor
		  
		  me.SetRequestHeader("User-Agent:", cUserAgent)
		  me.Yield = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FetchData(toget as Pair) As String
		  Dim va as String
		  
		  ' check if API is going to be called via GET or POST
		  ' everything else is an error (until further notice)
		  if Lowercase(toget.Left) = "get" then
		    va = me.Get(cBaseURL + toget.Right, 5)
		  elseif Lowercase(toget.Right) = "post" then
		    'me.post()
		  else
		    Raise new ReddiDeskException(-1)
		  end if
		  
		  ' todo: analyse headers for time constraints
		  if me.HTTPStatusCode = 200 Then
		    return va
		  Else
		    Raise new ReddiDeskException(me.HttpStatusCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetInstance() As ReddiDeskConnection
		  if mInstance = Nil Then
		    mInstance = new ReddiDeskConnection
		  end if
		  
		  return mInstance
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mInstance As ReddiDeskConnection
	#tag EndProperty

	#tag Property, Flags = &h0
		RawJsonString As String
	#tag EndProperty


	#tag Constant, Name = cBaseURL, Type = String, Dynamic = False, Default = \"http://www.reddit.com", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cUserAgent, Type = String, Dynamic = False, Default = \"ReddiDesk/0.0.1 by t0mt0m72", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="CertificateFile"
			Visible=true
			Group="Behavior"
			Type="FolderItem"
			EditorType="File"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CertificatePassword"
			Visible=true
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CertificateRejectionFile"
			Visible=true
			Group="Behavior"
			Type="FolderItem"
			EditorType="File"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConnectionType"
			Visible=true
			Group="Behavior"
			InitialValue="3"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RawJsonString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Secure"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
