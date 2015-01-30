#tag Class
Protected Class ReddiDeskSubreddits
	#tag Method, Flags = &h0
		Sub GetAllSubredditsRaw(sortOrder as String)
		  Dim conn As ReddiDeskConnection = ReddiDeskConnection.GetInstance
		  
		  ?count=1&after=t5_361kj
		  dim data as String = conn.FetchData("get":"/subreddits/" + lowercase(sortOrder) + ".json")
		  
		  Dim base_item as new JSONItem(data)
		  
		  System.DebugLog base_item.Child("data").ToString
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSRInformationRaw(subredditname as String) As JSONItem
		  System.DebugLog subredditname
		  
		  Dim conn As ReddiDeskConnection = ReddiDeskConnection.GetInstance
		  
		  dim data as String = conn.FetchData("get":"/r/" + subredditname + "/about.json")
		  
		  Dim base_item as new JSONItem(data)
		  Dim detail_item as JSONItem
		  
		  dim ii() as String
		  
		  ii() = base_item.Names
		  
		  detail_item = base_item.Child("data")
		  
		  return detail_item
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
