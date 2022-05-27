<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/ff142f0d18.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<style>
#carouselExampleControls{
      margin-left: 20%;
    margin-right: 20%;
    margin-top: 30px;
    margin-bottom: 30px;
} 
 
/*  이거 잘못수정 */
</style>
<title>신규회원 등록</title>
</head>
<body>
<div>
    <%@include file="/navbar.jsp" %>
</div>

   <div class="container">
   
   
      <h2>관리자 회원가입</h2>
      <!--폼 submit제출시 valid()함수 실행  -->
	<form action = "/admininsert.do" method="post">



         <div class="form-group">
            <label for="id" class="control-label col-sm-2">아이디</label>
            <div class="col-sm-3">
               영어대소문자,숫자(3~8자) <input type="text" class="form-control" id="adminId"
                  name="adminId" placeholder="아이디를 입력하세요.">
            </div>
            <span id="checkId"></span>
         </div>

         <div class="form-group">
            <label for="pass" class="control-label col-sm-2">비밀번호</label>
            <div class="col-sm-3">
            영어 대소문자,숫자(4~12자)
               <input type="password" class="form-control" id="password1"
                  name="password" placeholder="비밀번호를 입력하세요.">
            </div>
            <span id="checkPass1"></span>
         </div>

         <div class="form-group">
            <label for="pass2" class="control-label col-sm-2">비밀번호 확인</label>
            <div class="col-sm-3">
               <input type="password" class="form-control" id="password2"
                  name="memberPassword">
            </div>
            <span id="checkPass2"></span>
         </div>

         <div class="form-group">
            <label for="birth" class="control-label col-sm-2">생년월일</label>
            <div class="col-sm-3">
               <input type="date" class="form-control" id="adminRegno"
                  name="adminRegno" required />
            </div>
            <span id="sp"></span>
         </div>

         <div class="form-group">
            <label for="phonenum" class="control-label col-sm-2">휴대폰번호</label>
            <div class="col-sm-3">
               <input type="text" class="form-control" id="phoneNum"
                  name="phoneNum" placeholder="010-0000-0000">
            </div>
            <span id="spPhoneNum"></span>
         </div>

         <div class="form-group">
            <label for="zipcode" class="control-label col-sm-2">우편번호</label>
            <div class="col-sm-3">
               <input type="text" class="form-control" id="sample6_postcode"
                  name="adminZipcode">
            </div>
         </div>

         <input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()"
            value="우편번호 찾기"><br>
         <div class="form-group">
            <label for="addr1" class="control-label col-sm-2">주소</label>
            <div class="col-sm-3">
               <input type="text" class="form-control" id="sample6_address"
                  name="adminAddr1" required />
            </div>
            <span class="sp"></span>
         </div>


         <div class="form-group">
            <label for="addr2" class="control-label col-sm-2">상세주소</label>
            <div class="col-sm-3">
               <input type="text" class="form-control" id="sample6_detailAddress"
                  name="adminAddr2" required />
            </div>
            <span class="sp"></span>
         </div>

         <div class="form-group">
            <label for="mail" class="control-label col-sm-2">메일</label>
            <div class="col-sm-3">
               <input type="text" class="form-control" id="mail" name="adminMail"
               placeholder="abc@abc">
            </div>
            <span id="checkMail"></span>
         </div>

         <div class="form-group">
            <label for="nickname" class="control-label col-sm-2">닉네임</label>
            <div class="col-sm-3">
               한글,영문 대소문자,숫자(1~8자) <input type="text" class="form-control" id="nickname"
                  name="adminNickname" placeholder="닉네임을 입력하세요">
            </div>
            <span id="checkNickName"></span>
         </div>


         <div>
            <input type="submit" class="btn btn-primary" value="회원등록">
            <input type='reset' class="btn btn-primary" >
            
         </div>
      </form>
   </div>

	


   <script
      src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

   <script>
   

   
      function sample6_execDaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var addr = ''; // 주소 변수
                     var extraAddr = ''; // 참고항목 변수

                     //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                     }

                     // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                     if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== ''
                              && /[동|로|가]$/g.test(data.bname)) {
                           extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== ''
                              && data.apartment === 'Y') {
                           extraAddr += (extraAddr !== '' ? ', '
                                 + data.buildingName
                                 : data.buildingName);
                        }
                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('sample6_postcode').value = data.zonecode;
                     document.getElementById("sample6_address").value = addr;
                     // 커서를 상세주소 필드로 이동한다.
                     document.getElementById("sample6_detailAddress")
                           .focus();
                  }
               }).open();
      }

      //   아이디 유효성검사 
      //keyup 이벤트 : 키를 눌렀다가 떼는 순간
      $('#adminId').on('keyup',function() {
                     let regId = /^[a-zA-Z0-9]{3,8}$/;

                     if ($('#adminId').val() == "") {
                        $("#checkId").html('아이디를 입력하세요.').css('color',
                              'red');
                        return false;
                     } else {
                        if (!regId.test($('#adminId').val())) {
                           $("#checkId").html('잘못된 형식입니다').css(
                                 'color', 'red');
                           return false;
                        }
                     }

                     /*          let userId = $('#id').val(); //input_id에 입력되는 값 */
                     $.ajax({
                        url : "/Spectrum/member/idCheckService.do",
                        type : "post",

                        data : {
                           "userId" : $('#adminId').val()
                        },
                        dataType : 'json',
                        success : function(aa) {
                           if (aa.cd == "ok") {
                              $("#checkId").html('중복된 아이디입니다.').css(
                                    'color', 'red');
                           } else {
                              $("#checkId").html('사용 가능한 아이디입니다.').css('color','white');

                           }
                        },
                        error : function() {
                           alert("서버요청실패");
                        }

                     });
                  });
      
      //이름 유효성검사
      $('#name').on('keyup',function() {
               let regName = /^[가-힣]{2,8}$/;

               if ($('#name').val() == "") {
                  $("#checkName").html('이름을 입력하세요.').css('color','red');
                  return false;
               } else {
                  if (!regName.test($('#name').val())) {
                     $("#checkName").html('잘못된 형식입니다').css('color','red');
                     return false;
                  } else {
                     $("#checkName").html("");
                  }
               }
            });
      

      //비밀번호 유효성검사
      $('#password1').on('keyup',function() {
               let regPass = /^[a-zA-Z0-9]{4,12}$/;

               if ($('#password1').val() == "") {
                  $("#checkPass1").html('비밀번호를 입력하세요.').css('color','red');
                  return false;
               } else {
                  if (!regPass.test($('#password1').val())) {
                     $("#checkPass1").html('잘못된 형식입니다').css('color','red');
                     return false;
                  } else {
                     $("#checkPass1").html("사용가능한 비밀번호입니다.").css('color','white');
                  }
               }
            });

      //비밀번호 일치확인
      $("#password2").on('keyup', function() {
         var pass1 = $('#password1').val();
         var pass2 = $('#password2').val();
         if (pass1 != pass2) {
            $("#checkPass2").html("일치하지 않습니다.").css('color', 'red');
            return false;
         } else {
            $("#checkPass2").html("일치합니다.").css('color','white');
         }
      });

      //휴대폰번호 유효성검사   
      $("#phoneNum").on('keyup', function() {
           var phoneNum = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/
         if ($("#phoneNum").val() == "") {
            $("#spPhoneNum").html("일치하지 않습니다.").css('color', 'red');

            return false;
         } else {
         if (!phoneNum.test($("#phoneNum").val())) {
            $("#spPhoneNum").html('잘못된 형식입니다').css('color', 'red');
            return false;
         } else {
               $("#spPhoneNum").html("").css('color','white');
            }
         }
      });
      
      
      //이메일 중복검사 
      //keyup 이벤트 : 키를 눌렀다가 떼는 순간
      $('#mail').on('keyup', function() {
         let regMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         
         if ($('#mail').val() == "") {
            $("#checkMail").html('이메일을 입력하세요.').css('color','red');
            return false;
         } else {
            if (!regMail.test($('#mail').val())) {
               $("#checkMail").html('잘못된 형식입니다').css('color', 'red');
               return false;
            }
         }

         /*          let userId = $('#id').val(); //input_id에 입력되는 값 */
         $.ajax({
            url : "/Spectrum/member/mailCheckService.do",
            type : "post",

            data : {
               "userMail" : $('#mail').val()
            },
            dataType : 'json',
            success : function(aa) {
               if (aa.cd == "ok") {
                  $("#checkMail").html('사용할 수 없는 메일입니다.').css('color', 'red');

               } else {
                  $("#checkMail").html('사용가능한 메일입니다.').css('color','white');

               }
            },
            error : function() {
               alert("서버요청실패");
            }
         });
      });

      //   닉네임 중복검사 
      //keyup 이벤트 : 키를 눌렀다가 떼는 순간
      $('#nickname').on('keyup', function() {
         
         let regNickName= /^[가-힣a-zA-Z0-9]{1,8}$/;
         
         if ($('#nickname').val() == "") {
            $("#checkNickName").html('아이디를 입력하세요.').css('color','red');
            return false;
         } else {
            if (!regNickName.test($('#nickname').val())) {
               $("#checkNickName").html('잘못된 형식입니다').css('color', 'red');
               return false;
            }
         }
         /*          let userId = $('#id').val(); //input_id에 입력되는 값 */
         $.ajax({
            url : "/Spectrum/member/NickNameCheckService.do",
            type : "post",

            data : {
               "userNickName" : $('#nickname').val()
            },
            dataType : 'json',
            success : function(aa) {
               if (aa.cd == "ok") {
                  $("#checkNickName").html('증복된 닉네임입니다.').css('color', 'red');
               } else {
                  $("#checkNickName").html('사용할 수 있는 닉네임입니다.').css('color','white');
               }
            },
            error : function() {
               alert("서버요청실패");
            }
         });
      });
   </script>
</body>
</html>