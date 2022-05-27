<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
   String memberNickname = (String) session.getAttribute("memberNickname");
   String mbtiCode = (String) session.getAttribute("mbtiCode");
   /* String memberId=(String)session.getAttribute("memberId"); */
   String ipAddress=request.getRemoteAddr();
   if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
       InetAddress inetAddress=InetAddress.getLocalHost();
       ipAddress=inetAddress.getHostAddress();
   }
   
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title><%=mbtiCode %> 채팅방</title>
<script src="jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<% if(mbtiCode == null || mbtiCode.equals("0")){ %>
<script>

  alert("MBTI 검사 후 이용가능합니다.");
  history.go(-1);

</script>
<% } %>
<style type="text/css">
   *{ margin: 0; padding: 0; }
 
 .chat_wrap{width: 50%; }
 .header { 
    text-align: center; 
    position: relative;
    top: -10px;
    width: 100%;
    left: 0;
    right: 0;
    padding: 0.7rem;
}
.header h1{
	margin-bottom: 0;
}
 .chat_wrap .chat { padding-bottom: 80px; }
 .chat_wrap .chat ul {  list-style: none; }
 .chat_wrap .chat ul li { }
 .chat_wrap .chat ul li.left { text-align: left; }
 .chat_wrap .chat ul li.right { text-align: right; }
  
 .chat_wrap .chat ul li > div { font-size: 1.3rem; font-weight: bold;}
 .chat_wrap .chat ul li > div.sender { margin: 10px 20px 0 20px; font-weight: bold; }
 .chat_wrap .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #fcfcfcf0; color: #555; text-align: left; }
  
 .chat_wrap .input-div { position: fixed; width: 50%; bottom: 0;  background-color: #FFF; text-align: center; border-top: 1px solid #7ea2f1; }
 .chat_wrap .input-div > textarea {  height: 80px;border: none; padding: 10px; }
 #messageText{
    width: 100%;
 }
 #chatRoom{
   width: 50%;
      padding: 5px;
      margin: 0px auto;
      position: fixed;
      right: 0;
 font-size: 1.2rem;
   }
   #chatRoom select {
      width : 100%;
      font-size: 1.3rem;
   }

   
 .format { display: none; }
 #chat_all{
   display: flex;
 }
 body {
  padding-top: 70px;
}
 
   
</style>
</head>
<body>
<div id="header">
    <%@include file="navbar.jsp" %>
</div>
      <div class="header">
      	<h1><%=mbtiCode %> 채팅방</h1>
      </div>
   <div id="chat_all">
   <div class="chat_wrap" id="chatArea">
      <div class="chat">
         <ul>
            <!-- 동적 생성 -->
         </ul>
      </div>
      <div class="input-div">
         <textarea id="messageText" placeholder="메세지 입력 후 엔터를 눌러주세요."></textarea>
      </div>
    
      <!-- format -->
    
      <div class="chat format">
         <ul>
            <li>
               <div class="sender">
                  <span></span>
               </div>
               <div class="message">
                  <span></span>
               </div>
            </li>
         </ul>
      </div>
   </div>
   <div id="chatRoom">
      <span id="chatRoomName"> <%=mbtiCode %></span> 채팅방 멤버 목록<br>
      <select id="chatRoomMemList" size="20" multiple="" class="form-select"></select><br>
   	  <input type="button" value="채팅방 나가기" onclick="closing()" class="btn btn-secondary">
   </div>
    </div>
    
    <script type="text/javascript">
    
            //웹소켓 초기화 시연할 때는 톰캣서버구동할 컴퓨터의 아이피 주소로 설정해야함
            <%if (ipAddress.equals("192.168.144.10")) {%>
               let webSocket = new WebSocket(
                     "ws://localhost/Spectrum/mbtiGroupMultiChat.do");
            <%} else {%>
               let webSocket = new WebSocket(
                     "ws://192.168.144.10/Spectrum/mbtiGroupMultiChat.do");
            <%}%>
       let messageText = document.getElementById("messageText");
       const myName = "<%=memberNickname%>";

       $(document).on('keydown', 'div.input-div textarea', function (e) {
          let key = e.key || e.keyCode;
            if ((key === 'Enter' && !event.shiftKey) || (key === 13 && key !== 16)) {
               e.preventDefault();
               
               // 메시지 전송
               sendMessage();
               // 입력창 clear
               clearTextarea();
            }
         });
       
       

   // 메세지 태그 생성
   function createMessageTag(LR_className, senderName, message) {
      // 형식 가져오기
      let chatLi = $('div.chat.format ul li').clone();

      // 값 채우기
      chatLi.addClass(LR_className);
      chatLi.find('.sender span').text(senderName);
      chatLi.find('.message span').text(message);

      return chatLi;
   }
   // 메세지 태그 append
    function appendMessageTag(LR_className, senderName, message) {
        const chatLi = createMessageTag(LR_className, senderName, message);
 
        $('div.chat:not(.format) ul').append(chatLi);
 
        // 스크롤바 아래 고정
      //   $('div.chat').scrollTop($('div.chat').prop('scrollHeight'));
        window.scrollTo(0,document.body.scrollHeight);
      
    }


   // 메세지 입력박스 내용 지우기
   function clearTextarea() {
      $('div.input-div textarea').val('');
   }




       
          // 처음 접속 성공하면 
            webSocket.onopen = function onOpen(event){
               webSocket.send( createMessage("connect", "<%=mbtiCode%>", myName.value));
            }
           
            //메시지가 오면 messageTextArea요소에 메시지를 추가한다.
            webSocket.onmessage = function processMessge(message){
               //Json 풀기
               let jsonData = JSON.parse(message.data);
               if(jsonData.message != null) {
                  let LR = (jsonData.username != myName) ? "left" : "right";
                  appendMessageTag(LR, jsonData.username, jsonData.message);
               };
                  
               if(jsonData.roomName != null){
                  document.getElementById("chatRoomName").innerHTML = jsonData.roomName;
               }
               
               // 채팅방 멤버 목록 출력하기
               if(jsonData.roomMemList != null){
                  let jsonRoomMemList = JSON.parse(jsonData.roomMemList);
                  let selElement = document.getElementById("chatRoomMemList");
                  let strHtml = "";
                  for(let i=0; i<jsonRoomMemList.length; i++){
                     strHtml += "<option value='" + jsonRoomMemList[i] + "'>" + jsonRoomMemList[i] + "</option>";
                  }
                  selElement.innerHTML = strHtml;
               }
            }
           
            webSocket.onerror = function showErrorMsg(event) {
               alert("오류 : " + event.data);
            }
         
            webSocket.onclose = function(event){
               document.getElementById("chatArea").style.display = "none";
               history.go(-1);

            }
       
    
       // 메시지 구조  {"command" : "명령종류", "room" : "채팅방이름", "message" : "메시지" }
       // 명령 종류 : "create" - 채팅방 만들기, "change" - 채팅방 이동, "message" - 메시지 전송, "connect" - 처음 접속 
       
       
         //메시지 보내기
         function sendMessage(message){
             if(messageText.value.trim()==""){
                messageText.focus();
                return;
             } 
            let room = "<%=mbtiCode%>";
            
            //webSocket.send('{"room" : "' + "전체" + '", "message" : "' + messageText.value + '"}' );
            webSocket.send( createMessage("message", room, messageText.value) );
         }
       
       
       
       // 전송할 메시지를 작성하는 함수
       function createMessage(command, room, message){
          return '{"command" : "' + command + '", "room" : "' + room + '", "message" : "' + message + '"}'
       }
        
         function closing(){
            webSocket.close();
         }
         
         window.onbeforeunload = function(){
            closing();
         }
    </script>
</body>
</html>