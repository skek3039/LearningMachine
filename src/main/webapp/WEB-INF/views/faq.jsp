<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Learning Machine</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="./resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="./resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="./resources/css/style.css" rel="stylesheet">
<link href="./resources/css/admin.css" rel="stylesheet">

<style type="text/css">
    <style>@font-face {
        font-family: 'LeferiPoint-WhiteObliqueA';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    body {
        font-family: LeferiPoint-WhiteObliqueA;
    }

    details {
        border-bottom: 1px solid #efefef;
        color: #666;
        font-size: 16px;
        padding: 15px;
    }


    details[open] summary {
        font-weight: 800;
    }

    details > summary {
        color: white;
        font-size: 17px;
        padding: 15px 0;
    }

lement.style {
}
.pg___faq .faq_section {
    padding: 2rem 0.5rem;
}
article, aside, figure, footer, header, hgroup, section {
    display: block;
}
*, :after, :before {
    box-sizing: inherit;
}
user agent stylesheet
section {
    display: block;
}
body {
    text-rendering: optimizeSpeed;
    -webkit-text-size-adjust: 100%;
    -moz-text-size-adjust: 100%;
    text-size-adjust: 100%;
    font-feature-settings: "ss05";
    min-height: 100vh;
    color: #000a12;
    background-color: #fff;
}
body {
    color: #454545;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
}
body, button, input, select, textarea {
    font-family: Pretendard,-apple-system,BlinkMacSystemFont,system-ui,Roboto,Helvetica Neue,Segoe UI,Apple SD Gothic Neo,Noto Sans KR,Malgun Gothic,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,sans-serif;
}
:host, :root {
    --fa-font-thin: normal 100 1em/1 "Font Awesome 6 Pro";
}
:host, :root {
    --fa-font-solid: normal 900 1em/1 "Font Awesome 6 Pro";
}
:host, :root {
    --fa-font-regular: normal 400 1em/1 "Font Awesome 6 Pro";
}
:host, :root {
    --fa-font-light: normal 300 1em/1 "Font Awesome 6 Pro";
}
:host, :root {
    --fa-font-duotone: normal 900 1em/1 "Font Awesome 6 Duotone";
}
:host, :root {
    --fa-font-brands: normal 400 1em/1 "Font Awesome 6 Brands";
}
:root {
    --swiper-theme-color: #007aff;
}
html {
    position: relative;
    overflow-x: hidden;
    overflow-y: auto;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    min-width: 300px;
    min-height: 100%;
    background-color: #fff;
    touch-action: manipulation;
    -webkit-tap-highlight-color: transparent;
    -webkit-overflow-scrolling: touch;
    -webkit-text-size-adjust: 100%;
    -moz-text-size-adjust: 100%;
    -ms-text-size-adjust: 100%;
    line-height: 1.625;
    scroll-behavior: smooth;
}
html {
    font-size: 16px;
    -moz-osx-font-smoothing: grayscale;
    -webkit-font-smoothing: antialiased;
    overflow-y: scroll;
    text-rendering: optimizeLegibility;
    text-size-adjust: 100%;
}
*, :after, :before {
    box-sizing: inherit;
}
*, :after, :before {
    box-sizing: inherit;
}
    
</style>



</head>

<body>
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<jsp:include page="./header.jsp" />
		<div style=" width: 100%;">
		<div style="position: relative;">
		<jsp:include page="./notice_nav.jsp"/>
		 </div>
		<div style="padding-top: 110px;"><h3>&nbsp;&nbsp;자주묻는질문</h3><hr style="border: solid 1px;"></div>
		<div style="padding-top: 10px;padding-left: 120px; height: 750px;">
				 
				 <ul class="accordions list">
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[계정] 구매했던 강의가 전부 사라졌어요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>잠깐! 지금 로그인하신 계정으로 구매하신 것이 맞으신가요?</strong><br>인프런은 여러 개의 계정을 동시에 사용할 수 있어요. 소유하신 다른 계정이 있다면 확인 부탁드려요.</p>
<p>※ 혹시 다른 계정 확인 후에도 구매한 강의를 찾지 못하셨나요?<br>우측 하단의 1:1 문의하기로 내용 남겨주시면 확인 후 계정을 찾아드릴게요 :-)</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[계정] 이메일 계정을 변경하고 싶어요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><span style="color: #34495e; font-size: 16px; font-weight: bold; text-align: center; background-color: #e7f9e4;">&nbsp;다른 이메일 주소로 변경하고 싶을 경우 방법은 아래와 같아요.&nbsp;</span></p>
<ol style="list-style-type: decimal;">
<li>[대시보드]-[프로필]-[이메일]에서 새로운 이메일 입력<br>2. 안내된 인증 절차를 거치면 계정 변경 완료<br><br>※ 소셜 계정으로 가입한 경우 로그아웃 상태에서 '비밀번호 찾기'를 통해 <strong>비밀번호를 먼저 설정</strong> 후 진행해 주셔야 해요.</li>
</ol>
<hr style="margin: 2rem 0; border-top: 1px solid #ededed; border-bottom: 1px solid #fff;">
<p><span style="background-color: #e7f9e4; color: #34495e; font-weight: bold; text-align: center;">&nbsp;소셜 계정을 일반 계정(인프런)으로 전환하고 싶을 경우 방법은 아래와 같아요.&nbsp;</span></p>
<ol style="list-style-type: decimal;">
<li>카카오톡, 구글, 페이스북 등 소셜 계정으로 가입하셨다면?</li>
<li>로그아웃 상태에서 '비밀번호 찾기'로 비밀번호 생성 (단독 계정 생성)</li>
<li>소셜 연동 해지: 카카오톡/구글/페이스북 등 소셜 설정에 들어가서 연동 해지&nbsp;</li>
</ol>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[계정] 비밀번호를 찾고 싶어요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>로그인 화면에서 '비밀번호 찾기'를 클릭해주세요.</strong><br>사용 중인 계정을 입력하면 이메일을 통해 비밀번호 변경 링크를 보내드려요.</p>
<p><span style="background-color: #ffffff; font-family: 'Noto Sans KR', -apple-system, 'system-ui', BlinkMacSystemFont, 'Apple SD Gothic Neo', 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif, Oxygen, Ubuntu, Cantarell, 'Fira Sans', 'Droid Sans', Helvetica;">※ </span>혹시, 소셜 계정으로 연동해 사용 중이신가요?<strong> </strong>(카카오톡/페이스북/구글/깃허브/애플)<br>소셜 계정의 경우 인프런에서는 여러분의 비밀번호를 보관하고 있지 않아요.<br>인프런에서 사용하는 별도의 비밀번호를 생성하고 싶으시다면 <a href="https://www.inflearn.com/settings/account" target="_blank" rel="noopener">프로필 설정</a>에서 새로운 비밀번호를 발급받아주세요.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[계정] 지금 계정에 있는 강의를 다른 계정으로 옮기고 싶어요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>현재 계정 간 강의 이동 서비스를 제공하고 있지 않아요.</strong><br>강의 저작권에 문제가 발생할 수 있기 때문에 각 계정은 개별 사용자로 인식하고 있어요.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[서비스오류] 인프런 영상 재생 중 오류가 발생해요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>현재 인프런 강의 재생과 관련하여 몇 가지 오류가 있어 조치 중입니다.</strong></p>
<p>재생 오류와 관련한 자세한 내용은 아래 링크로 첨부해드리니, 해당되는 내용이 있으신지 확인 후 문서에 안내된 내용에 따라 이용해주시기 바랍니다. 관련 문제는 빠르게 해결하도록 하겠습니다.<br><br>※ <a href="https://doc.clickup.com/3686375/p/h/3gfz7-224325/b99b793e359ab62" target="_blank" rel="noopener noreferrer">재생 오류 문서 확인하기</a> (클릭)</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[서비스오류] 인프런 서비스 이용 중 오류가 발생해요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>인프런은 구글 크롬 브라우저에 최적화되어 있어요.</strong><br>강의 시청, 결제 등 서비스 이용 중 오류가 발생할 경우 크롬 브라우저에서 다시 진행해 주세요.</p>
<p>※ 인프런은 Internet Explorer를 지원하지 않는 점 참고 부탁드립니다.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[강의] 수강 전인데 강의에 궁금한 점이 있어요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p class="ql-block" data-block-id="block-ecb837e7-e49b-4a43-89d8-0656b58ac571"><strong>강의를 결제하기 전, 궁금한 점이 있으실 경우 [수강 전 문의 게시판]을 통해 지식공유자님에게 직접 질문을 남길 수 있어요.</strong></p>
<p class="ql-block" data-block-id="block-68aae72d-7643-457e-8aad-da28b3b5e897">※ 수강 전 문의하기 기능을 설정한 강의에 한정하여 제공되니 꼭 확인해 주세요.<br><br></p>
<div class="ql-block" data-block-id="block-68aae72d-7643-457e-8aad-da28b3b5e897"><img src="https://cf.channel.io/pub-file/4627/600512a37505ec716a21/before-question.jpg"></div>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[강의] 강의자료는 어디에서 확인하나요?</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p class="ql-block" data-block-id="block-89ff2088-cee4-40ff-ae32-d29250c43544"><strong>강의 동영상을 클릭 후 상단 바 혹은 목차 내에 구름 아이콘을 확인해 주세요.</strong></p>
<p class="ql-block" data-block-id="block-89ff2088-cee4-40ff-ae32-d29250c43544">※ 강의마다 강의자료가 위치한 섹션이 다르니 참고해 주세요.</p>
<div class="ql-block" data-block-id="block-f091ca24-210f-42e4-a869-d98a30e86df8">&nbsp;</div>
<div class="ql-block" data-block-id="block-f091ca24-210f-42e4-a869-d98a30e86df8"><img src="https://cf.channel.io/file/4627/5fa4d1f2e6d5c25853f5/lecture-download.jpg"></div>
<div class="ql-block" data-block-id="block-f091ca24-210f-42e4-a869-d98a30e86df8">&nbsp;</div>
<div class="ql-block" data-block-id="block-f091ca24-210f-42e4-a869-d98a30e86df8">&nbsp;</div>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[강의] 수료증은 어떻게 발급받나요?</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>수료증은 강의를 100% 완강하신 후 강의 완료 버튼을 누르시면 자동으로 발급됩니다.</strong> <br><span style="font-weight: bold;"> </span>대시보드 &gt; 🏆 My Certificate(증명서) 란에서 확인 가능하세요 :)</p>
<p>수료증에는 아래 내용을 포함하여 발급되며, 데이터는 임의로 변경하실 수 없습니다. 다른 곳에서도 증빙할 수 있는 신의성있는 서류임을 입증하기 위해서 임의로 수정할 수 없는 점 양해 부탁드려요. <br>❶ 성명<br>❷ 완강한 강의명<br>❸ 교육 이수시간<br>❹ 교육 시작일 &amp; 종료일</p>
<p>※ 단, 수료증은 유료 또는 일부 무료 강의에 한해 발급되는 점 참고 부탁드려요.<br><b>혹시 수료증 출력이 안될 경우,</b> 인쇄 옵션에서 ‘배경 그래픽 표시’를 선택해 주시면 이미지가 정상적으로 작동 되실 거에요!</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[강의] 수강 중인 강의에 대한 증빙이 필요해요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>아직 강의를 100% 수강하지 못하셨다면 수강확인증을 통해 증빙이 가능해요.</strong><br>대시보드 &gt; 내 학습에서 수강확인증을 발급받으실 수 있어요.</p>
<p><img src="https://cf.channel.io/pub-file/4627/613960cbec2f7fa9d86e/file.JPG"></p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[강의] 강의별 수강 기한이 궁금해요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>수강 기한은 강의 페이지 우측 배너에서 확인하실 수 있어요.</strong><br><br>※ '평생 무제한 수강'이라고 적혀 있다면 수강 기간의 제한이 없지만, 강의마다 모두 상이하니 꼭 체크해 주세요.<br>또한, 수강 기한을 연장하거나 수강 상태를 정지하는 기능은 제공하지 않습니다.</p>
<p><img src="https://cf.channel.io/pub-file/4627/600512939f683af84666/period-check.jpg"></p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[강의] 나에게 딱 맞는 강의를 추천받고 싶어요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>어떤 강의를 수강할 지, 어떤 강의가 내게 필요한 지 고민 중이신가요?&nbsp;</strong><br>학습자마다 선수 지식, 체감 난이도, 습득력 등 개인 역량이 모두 다르기 때문에 구체적인 강의 상담은 어려워요. 하지만 꼭 맞는 강의를 찾는 데에 도움이 될 만한 방법들을 알려드릴게요.<br><br><span style="background-color: #e7f9e4;"><a style="background-color: #e7f9e4;" href="https://www.inflearn.com/beginner" target="_blank" rel="noopener noreferrer">❶ 인프런 입문강의 추천받기</a></span><br>아직 초보단계라면, 듣고 싶은 분야의 강의를 추천받을 수 있어요.<br>인프런 지니가 여러분에게 딱 맞는 강의를 추천해 줄 거예요.<br><br><br><span style="background-color: #e7f9e4;"><a style="background-color: #e7f9e4;" href="https://www.inflearn.com/roadmaps" target="_blank" rel="noopener noreferrer">❷ 로드맵 찾아가기</a> </span><br>좀 더 체계적이고 탄탄하게 짜여진 학습을 원하신다면,<br>듣고 싶은 분야의 강의를 난이도별 &amp; 유형별로 엮어서 추천해 주는 로드맵 기능을 이용해 보세요.<br><br><br><span style="background-color: #e7f9e4;"><a style="background-color: #e7f9e4;" href="https://www.inflearn.com/tag-curation/tag/356" target="_blank" rel="noopener noreferrer">❸ 인프런 베스트셀러 강의</a></span><br>가장 인기가 많았던 인프런의 베스트 강의를 둘러보면서 마음에 드는 강의를 찾아볼 수도 있어요.<br>분명 강의 선정에 도움이 될 거예요.<br><br><br><span style="background-color: #e7f9e4;"><a style="background-color: #e7f9e4;" href="https://www.inflearn.com/courses" target="_blank" rel="noopener">❹ 스킬태그 검색</a></span><br>원하는 키워드가 포함된 강의만 골라 보고 싶다면, 상단의 기술 검색을 활용해 보세요.<br>필요한 강의를 찾는 데에 시간을 절약해 줄 거예요.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[강의] 로드맵은 어떤 기능인가요?</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p style="text-align: left;"><strong>로드맵이란 효율적이고 체계적인 학습을 위해 여러 강의를 난이도별&amp;유형별로 엮어 큐레이션 해주는 기능이에요.</strong><br>어떤 강의를 어떤 순서로 들어야 할지 막막할 때, 듣고 있는 강의의 다음 스텝에 대한 정보가 필요할 때 로드맵 기능을 활용해 보세요.</p>
<p style="text-align: left;"><span style="background-color: #ffffff; color: #333333; font-family: 'Helvetica Neue', Helvetica, Arial, 微軟正黑體, 微软雅黑, メイリオ, '맑은 고딕', sans-serif; font-size: 14px; letter-spacing: normal;">📍</span><b>&nbsp;</b><span style="background-color: #e7f9e4;"><a style="background-color: #e7f9e4;" href="https://www.inflearn.com/roadmaps" target="_blank" rel="noopener">로드맵 확인하러 가기</a></span></p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[강의] 진도율을 초기화할 수 있나요?</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>진도율은 환불 및 수료증 발급과 밀접하게 관련된 정보로 초기화 기능이 제공되지 않아요.</strong><br><br><span style="font-family: 'Noto Sans KR', -apple-system, 'system-ui', BlinkMacSystemFont, 'Apple SD Gothic Neo', 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif, Oxygen, Ubuntu, Cantarell, 'Fira Sans', 'Droid Sans', Helvetica; background-color: #ffffff;">※ </span>혹시 이미 완강한 강의를 복습하고 계신가요?<br>재수강 진도율 체크가 불편할 땐 <strong>'강의 노트 기능'</strong>을 사용해보세요. 언제, 어디까지 강의를 들었는지 메모할 수 있어요.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[강의] 동시 접속이 가능한가요?</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>수강 중 동시 접속은 제한하고 있어요.<br></strong>즉, 학습페이지는 1대에서만 접속할 수 있으며 다른 곳에서 동시 학습할 경우 학습이 제한될 수 있어요.<br>해당 내용은 <a href="https://www.inflearn.com/policy/terms-of-service" target="_blank" rel="noopener">이용약관</a>에 동시 접속 부정이용에 대하여 명시하였기에 법적 제재를 받으실 수 있는 점 참고해 주세요.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[강의] 기기 등록은 몇 대까지 가능한가요?</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><b>기기 등록은 한 계정당 최대 3대까지 가능해요.&nbsp;<br></b>현재 내가 등록된 기기를 확인할 수 있는 페이지는 별도로 제공하고 있지 않습니다.<br>로그인 시점마다 기기 등록이 갱신되어 별도의 초기화 요청 없이도 이용 가능합니다.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[강의] 수강평은 어디서 작성할 수 있나요?</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>일정 진도율 (5%)을 넘으면 학습페이지 하단에 '수강평 등록' 창이 나타나요.</strong><br>혹은 강의 동영상 상단에 '수강평 작성하기' 버튼을 클릭 후 수강평 작성이 가능해요.</p>
<p><img src="https://cf.channel.io/thumb/720x654,inside/pub-file/4627/603d877bb1ef3982db9b/_.png"></p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[결제] 현금영수증을 발행하고 싶어요</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>현금영수증은 무통장입금(가상 계좌) 결제 화면에서 직접 신청이 가능해요.</strong><br>결제를 완료하셨다면 영업일 2~5일 후 <a href="https://www.inflearn.com/orders" target="_blank" rel="noopener">프로필 &gt; 구매 내역 &gt; 영수증</a>에서 직접 확인하실 수 있습니다.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[결제] 구매 영수증은 어떻게 확인하나요?</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p>구매 영수증 및 거래명세서는 <a href="https://www.inflearn.com/orders" target="_blank" rel="noopener">프로필&gt; 구매 내역</a>에서 직접 확인이 가능해요.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[결제] 전자세금계산서 발급이 가능한가요?</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>인프런은 PG사를 통한 가상 계좌 결제방식을 제공하고 있어 전자세금계산서 발행이 불가능해요.</strong> <br>다만, 전자세금계산서와 법적 증빙 효력이 동일한 현금영수증을 발행 받아보실 수 있어요.</p>
<p style="text-align: justify;">※ 현금영수증은 가상 계좌 결제 화면에서 직접 신청이 가능해요.<br>결제 후 신청한 현금영수증 내역을 확인하고 싶다면, 프로필 &gt; 구매 내역 &gt; 영수증을 클릭해 주세요.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[결제] 강의를 환불하고 싶어요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p>수강 신청한 유료강의를 환불하고 싶으신가요?<br><a href="https://www.inflearn.com/orders" target="_blank" rel="noopener noreferrer">프로필 &gt; 구매내역</a>에서 환불을 원하는 '주문명'를 클릭하시면 직접 환불하실 수 있어요. 단, 환불 조건에 부합하지 않는 경우 취소 버튼이 비활성화되니 참고해 주세요!<br><br><b>인프런의 환불 원칙은 다음과 같습니다.</b><br>1) 강의 구매일 1주 이내에 진도율 7% 미만일 경우 전액 환불이 가능합니다.<br>2) 강의 구매일이 1주일이 넘었거나, 진도율이 7% 이상일 경우 환불이 불가합니다.<br>3) 1강으로 구성된 개별강의는 원칙적으로 환불이 불가능 합니다.<br>4) 강의 자료를 다운로드 받는 경우, 환불이 불가합니다.<br>5) 특별강의는 이벤트성 강의, 비정규 강의, 특별기획 강의 등으로서 이는 별도의 수강 취소, 변경 및 환불규정이 적용될 수 있습니다.<br><br>※ 더 자세한 내용은 <a href="https://www.inflearn.com/policy/terms-of-service" target="_blank" rel="noopener noreferrer">이용약관 제20조 청약철회</a>에서 확인하실 수 있어요.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[결제] 내일배움카드/교육비 환급 등 지원받을 수 있나요?</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>인프런은 현재 한국산업인력공단에 훈련기관으로 등록되어 있지 않아요.</strong><br>따라서 고용보험 환급 과정 지원과 내일배움카드 이용이 불가합니다.<br>앞으로 국가 지원 대상 업종이 될 수 있도록 더욱 노력하는 인프런이 되겠습니다.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[할인] 현재 진행 중인 할인이 궁금해요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>상시로 진행 중인 할인 이벤트는 아래와 같아요.<br></strong><br><strong><span style="background-color: #e7f9e4;"><a style="background-color: #e7f9e4;" href="https://www.inflearn.com/pages/kakao-friends-event" target="_blank" rel="noopener">1. 카카오톡 플러스친구 맺기</a></span></strong><br><span style="background-color: #e7f9e4;"><strong><a style="background-color: #e7f9e4;" href="https://www.instagram.com/inflearn__official/" target="_blank" rel="noopener">2. 인스타 팔로우&amp; 쿠폰코드 찾기</a></strong><br><br></span>이 외의 인프런의 모든 할인은 일정과 기간이 상이해요.<br><strong>할인 소식 알림을 설정</strong>해 두시면 메일 또는 인프런 홈페이지 알림으로 빠르게 소식을 받으실 수 있어요.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[할인] 할인과 쿠폰은 중복 적용이 안되나요?</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>모든 할인 및 쿠폰은 하나만 적용이 가능해요. <br></strong>할인 중인 강의라면 강의 할인이 우선 적용되어 쿠폰 적용이 안되는 점 참고해 주세요.<br>더욱 자세한 쿠폰 &amp; 할인 이용 안내는 <a href="https://www.inflearn.com/coupons" target="_blank" rel="noopener">쿠폰함 우측 상단</a>에서 확인해 주세요.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[할인] 15% 소속인증 할인이 궁금해요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><strong>현재 사용 중인 학교 (고등학교, 대학교 등) 또는 회사 메일이 있는 경우 참여하실 수 있어요.<br></strong>자세한 방법은 아래와 같아요.<br><br><span style="background-color: #e7f9e4;"><strong>① 15% 할인 받기 버튼 클릭</strong></span><br>수강 바구니에서 [15% 할인 받기 버튼]을 통해 학교 또는 회사 이메일을 입력해 주세요.<br><br><span style="background-color: #e7f9e4;"><strong>② 메일 인증하기</strong></span><br>작성해 주신 소속 이메일로 로그인 후 인프런에서 보낸 이메일 인증이 완료되면, 7일 동안 모든 강의에 15% 할인이 자동 적용됩니다. (단, 개별 할인 중인 강의 &amp; 프로모션 비동의 강의 제외)</p>
<p>※ 인증을 완료하신 후에는 소속 이메일 변경이 불가하니 참고해 주세요.</p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[멘토링] 인프런 멘토링 서비스가 궁금해요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <p><span style="font-weight: bold;">인프런 멘토링은 멘토와 멘티를 연결해 약속을 잡아주는 기능이에요.<br></span>커리어 상담부터 코드, 포트폴리오 리뷰까지 멘토가 필요할 땐 인프런 멘토링을 이용해 보세요. 지식공유자와 학습자가 더 쉽게 지식을 나누며 성장할 수 있답니다.<br><br>🧭&nbsp; <a href="https://www.inflearn.com/mentors" target="_blank" rel="noopener noreferrer"><span style="color: #1609d0;">멘토링 신청하러 가기</span></a><br>🌿 &nbsp;<span style="color: #169179;"><a href="https://www.inflearn.com/community/mentorings-reviews" target="_blank" rel="noopener noreferrer">멘토링 후기 살펴보기</a></span></p>
      </div>
    </div>
  </li>
  <li class="accordion qna_box">
    <div class="accordion-header question">
      <button class="click_button">
        <div class="plus-minus-toggle collapsed"></div>
        <p class="text">[탈퇴] 인프런을 탈퇴하고 싶어요.</p>
      </button>
    </div>
    <div class="accordion-body answer">
      <div class="accordion-content">
        <div class="ql-block" data-block-id="block-c1a5b03a-5316-46d5-ade7-096563f0e66d"><strong>대시보드 &gt; 프로필 설정의 '탈퇴'에서 가능해요.</strong><br><br>※ 탈퇴할 경우 해당 계정의 모든 데이터가 삭제되며 복구가 불가능하니 신중히 결정하시는 것을 권장 드려요.</div>
      </div>
    </div>
  </li></ul>
				 
				 
		<br>
<div id="pagination" style="border-top: 1px solid black; text-align: center;"><ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="linkPage" /></div>
		</div>
		<jsp:include page="./footer.jsp" />

</div>

		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>
	
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="./resources/lib/wow/wow.min.js"></script>
	<script src="./resources/lib/easing/easing.min.js"></script>
	<script src="./resources/lib/waypoints/waypoints.min.js"></script>
	<script src="./resources/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="./resources/js/main.js"></script>

	<script type="text/javascript">function linkPage(pageNo){location.href = "./faq?n_cate${n_cate}&pageNo=" + pageNo;}</script>		
	
</body>

</html>