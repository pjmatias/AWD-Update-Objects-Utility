AWD Update Objects Utility
Version 1.0 - January 3, 2019

----------------
Contents
----------------
1 - Overview
2 - Requirements
3 - Installation and configuration
4 - Known issues
5 - Instructions for use
6 - License

----------------
Overview
----------------

The AWD Update Objects Utility is a ruby-based, command-line program for systematically updating a large number of AWD objects (transactions, cases, sources, or folders).  The utility takes as an input a csv file of AWD objects ideas and a ruby file with the xml to be applied to the list of objects.  The utility was designed specifically for DST hosted environments (both DPC and DB2) but can function on most self-hosted or cloud-hosted configurations as well.

----------------
Requirements
----------------

This utility requires Ruby.  It was built and tested on version 2.5.1.  The installation site must also have access to the targeted AWD environments.

----------------
Installation and configuration
----------------

All files should be extracted to a single directory.

To configure:
	1 - Open the env_config.rb in a text editor.
	2 - Modify the $server, $server_dpc_non and $server_dpc_prod values to match the location of your AWD installation.  The $server value should be used if you have a consistent server location for both prod and non-prod environments.  The $server_dpc_non and $server_dpc_prod should be used if you have different locations for prod and non-prod.
	3 - Save the file
	4 - If specific certificates are required to access your AWD installation, replace the cacert.pem file with a pem file containing those specific certificates.
	
	
----------------
Known issues
----------------

None

----------------
Instructions for use
----------------

The AWD Update Objects Utility takes two inputs:
	1 - A csv file listing all of the AWD object ids to be updated
	2 - An xml.rb ruby file with the desired xml update to be applied to the transactions.
	
The csv file may be generated in any way desired (export from a SQL query, export from AWD Analytics, manually construct).  The xml.rb file may be edited in any text editor.  When editing the xml.rb file, you will normally edit only the portion in the $update_xml_content variable and use a static update.  For more advanced use cases, you may wish to write more complex ruby code to invoke variable updates.

To execute the utility,
	1 - Launch the Update.rb file
	2 - Enter the name of the target AWD environment along with the DPC status and valid credentials.  The DPC flag allows you to switch between the endpoints configured in the env_config.rb file.  'N' triggers the $server value, 'Y' triggers to $server_dpc_non and 'P' triggers the $server_dpc_prod. The user whose credentials you enter must have update permission to the objects in the csv file and to complete any updates you have configured in the xml.rb file.
	3 - Enter the path for the csv file.
	4 - The utility will complete the updates and return to the command line when complete.

----------------
License
----------------
This project is licensed under the MIT License - see LICENSE for details.
