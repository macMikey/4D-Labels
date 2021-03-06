//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project method : IFF_Get_long
  // Database: 4D Labels
  // ID[E4F1C8AD20374849AE76815F13B85263]
  // Created #18-12-2014 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  //
  // ----------------------------------------------------
  // Declarations
C_LONGINT:C283($0)
C_POINTER:C301($1)
C_POINTER:C301($2)
C_LONGINT:C283($3)

C_LONGINT:C283($Lon_byteOrder;$Lon_parameters;$Lon_result)
C_POINTER:C301($Ptr_offset;$Ptr_source)

If (False:C215)
	C_LONGINT:C283(IFF_Get_long ;$0)
	C_POINTER:C301(IFF_Get_long ;$1)
	C_POINTER:C301(IFF_Get_long ;$2)
	C_LONGINT:C283(IFF_Get_long ;$3)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=2;"Missing parameter"))
	
	  //Required parameters
	ASSERT:C1129(Not:C34(Is nil pointer:C315($1)))
	ASSERT:C1129(Type:C295($1->)=Is BLOB:K8:12)
	
	$Ptr_source:=$1  //BLOB Ptr
	
	ASSERT:C1129(Not:C34(Is nil pointer:C315($2)))
	ASSERT:C1129(Type:C295($2->)=Is longint:K8:6)
	
	$Ptr_offset:=$2  //offset Ptr
	
	$Lon_byteOrder:=PC byte ordering:K22:3
	
	  //Optional parameters
	If ($Lon_parameters>=3)
		
		$Lon_byteOrder:=$3  //{byte ordering} default PC byte ordering
		
	End if 
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
$Lon_result:=BLOB to longint:C551($Ptr_source->;$Lon_byteOrder;$Ptr_offset->)

  // ----------------------------------------------------
  // Return
$0:=$Lon_result

  // ----------------------------------------------------
  // End