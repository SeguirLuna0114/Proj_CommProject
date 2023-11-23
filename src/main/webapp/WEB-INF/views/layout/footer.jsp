<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <footer class="footer">
    <div class="footer_inner">
      <div class="top">
        <ul class="gnb">
          <li class="logo">Music Insite</li>
          <li><a href="#">기업소개</a></li>
          <li><a href="#">이용약관</a></li>
          <li><a href="#">개인정보 처리방침</a></li>
          <li><a href="#">고객센터</a></li>
        </ul>
      </div>
      <div class="bottom">
        <p>
          (주)Music Insite (대표이사:한국인) | 서울특별시 강남구 어디로 5953
          역삼동 삼거리빌딩 6층 | 통신판매번호 : 제 강남-8282호
        </p>
        <p>
          유료파견업체등록번호 : (국내) 제2023-231215-125-3-00001호 |
          (국외) 유럽가고싶부-유-2023-1 | 사업자등록번호 : 012-34-56789 |
          FAX : 02-123-4567
        </p>
        <p>© 2023 by MusicApp INSTITUTE, All Rights Reserved.</p>
      </div>
    </div>
  </footer>

  <!-- WebSocket 설정 -->
  <!-- WebJars를 통해 제공되는 jQuery 라이브러리를 사용 -->
  <script src="/webjars/jquery/jquery.min.js"></script>
  
  <!-- WebJars를 통해 제공되는 SockJS와 STOMP 라이브러리를 사용 -->
  <script src="/webjars/sockjs-client/sockjs.min.js"></script>
  <script src="/webjars/stomp-websocket/stomp.min.js"></script>
  
  <!-- 웹 소켓과 관련된 사용자 정의코드 -->
  <script src="${path}/js/webSocket.js"></script>
</body>
</html>