<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ page buffer = "1024kb" autoFlush="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Employee Information</title>
		<s:head />
		<style type="text/css" >
          
         table.mytable 
         { 
         border-collapse: collapse; 
         border: 5px solid #839E99;   
         border-color:green;
         font: 15, "Times New Roman", Times, serif; 
         color: black; 
         
         }  
         .mytable td, th 
         { 
         padding: 1px 1px .25em 1px; 
         line-height: 1em; 
         border: 3px solid #839E99; 
         border-color: skyblue;
         unicode-bidi: bidi-override;
         background:white;
		 resize: both;
		 overflow: auto;
         text-align: left;
         }  
         .mytable th 
         { 
         color:Blue; font-weight: bold; 
         text-align: center; 
         padding-right: .5em; 
         vertical-align: top;
         white-space:nowrap;
         }  
         .mytable thead th 
         { 
         text-align: center; 
         padding-left:0.1cm;
         padding-right:0.1cm;
         unicode-bidi:bidi-override;
         overflow:scroll;
         
        }  
		
		
         
        </style>
	</head>

	<body bgcolor="pink">
		<div align="left">
			  <s:form action="addOrUpdate">
				  <s:push value="employee">
				    <s:hidden name="employee.serialNo"/>
					<s:textfield name="employee.employeeCode" label="Employee Code" />
					<s:textfield name="employee.employeeName" label="Employee Name" />
					<s:textfield name="employee.dateOfJoining"
						label="Date Of Joining like( 05/11/1998)" />
					<s:textfield name="employee.managerName" label="Manager Name" />
					<s:textfield name="employee.department" label="Department" />
					<s:submit value="Add/Update" />
				  </s:push>
				</s:form>
			
		</div>
		<hr color="Red">
		
			<s:if test="employeeList.size>0">
			   <div class="content" align="center">
				<display:table id="empList" list="${employeeList}"
					requestURI="/employeeDetails" pagesize="15" export="true"  class="mytable">
					<display:column property="employeeCode" title="Employee Code"
						sortable="true" />
					<display:column property="employeeName" title="Employee Name" />
					<display:column property="dateOfJoining" title="Joining Date" />
					<display:column property="managerName" title="Manager Name" />
					<display:column property="department" title="Department" />
					<display:column title="Operation" media="html">
						<s:url id="update" action="updateEmployee">
							<s:param name="serialNo">${empList.serialNo}</s:param>
						</s:url>
						<s:a href="%{update}">Update</s:a>
                        ||
                        <s:url id="delete" action="deleteEmployee">
							<s:param name="serialNo">${empList.serialNo}</s:param>
						</s:url>
						<s:a href="%{delete}">Delete</s:a>
					</display:column>
				</display:table>
				</div>
			</s:if>
		
	</body>
</html>
