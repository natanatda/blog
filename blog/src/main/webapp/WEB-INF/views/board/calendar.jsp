<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Calendar</title>
    <style>
        table {
            border-collapse: collapse;
            width:80%;
            border:solid 1px #dbdbdb;
        }
		th{
			background-color: #a8cbff;
		}
        th, td {
            border: 1px solid black;
            padding: 5px;
            text-align: center;
        }
        #current-day {
            background-color: #0d6dfd;
            color: white;
            border-radius: 30px;
        }
    </style>
</head>
<body>
	<!-- ${year}년 ${month}월 -->
    <table>
        <tr>
            <th>일</th>
            <th>월</th>
            <th>화</th>
            <th>수</th>
            <th>목</th>
            <th>금</th>
            <th>토</th>
        </tr>
        
		<c:set var="emptyDays" value="${firstDayOfWeek - 1}" />
        <c:set var="currentDay" value="1" />
        <c:set var="endValue" value="${emptyDays + lastDay}" />
        
        <c:forEach var="week" begin="1" end="${endValue / 7 + (endValue % 7 == 0 ? 0 : 1)}">
            <tr>
                <c:forEach var="day" begin="1" end="7">
                    <c:choose>
                        <c:when test="${(week == 1 && day <= emptyDays) || (currentDay > lastDay)}">
                            <td></td>
                        </c:when>
                        <c:otherwise>
                            <td>
                                <c:if test="${currentDay == toDay}">
                                    <div id="current-day">${currentDay}</div>
                                </c:if>
                                <c:if test="${currentDay != toDay}">
                                    ${currentDay}
                                </c:if>
                            </td>
                            <c:set var="currentDay" value="${currentDay + 1}" />
                        </c:otherwise>
                    </c:choose>
				</c:forEach>
            </tr>
        </c:forEach>
    </table>
</body>
</html>