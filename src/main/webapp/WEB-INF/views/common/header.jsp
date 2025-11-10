<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 wow fadeIn" data-wow-delay="0.1s">
        <a href="/" class="navbar-brand d-flex align-items-center px-4 px-lg-5">

            <img src="/img/tindog_logo.png" style="width: 180px;">
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav me-auto p-4 p-lg-0"> 
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">중고마켓</a>
                    <div class="dropdown-menu rounded-0 rounded-bottom m-0">
                        <a href="/write" class="dropdown-item">판매하기</a>
                        <a href="/list" class="dropdown-item">구매하기</a>                        
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">친구찾기</a>
                    <div class="dropdown-menu rounded-0 rounded-bottom m-0">
                        <a href="/worldcup" class="dropdown-item">이상형월드컵</a>
                        <a href="/dbti" class="dropdown-item">댕BTI 검사</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                	<a href="/notice" class="nav-link">공지사항</a>
                </div>            
            </div>
            <div style="padding-right: 50px;">
            <a href="/login">Login | </a>
            <a href="/register">Sign Up</a>
            
            </div>
        </div>        
</nav>