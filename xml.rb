#enter the full update XML statement within double quotes in the $update_xml_content variable
#the current object ID can be accessesed with the variable $obj_id_var

$update_xml_content = "<?xml version='1.0' encoding='UTF-8' standalone='yes'?>
  <updateInstances xmlns='http://www.dsttechnologies.com/awd/rest/v1'>
    <updateInstance id=\"#{$obj_id_var}\">
    <businessAreaName>DELETED</businessAreaName>
	<typeName>DUMMY</typeName>
	<statusName>CREATED</statusName>
  </updateInstance>
  </updateInstances>"