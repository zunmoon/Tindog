function emailCheck() {
	const email = document.querySelector('.email-login-body');
	
	if(!(email.contains('@') && email.contains('.'))) {
		Swal.fire({
	        	title:"로그인 실패",
	        	text:"이메일을 확인해주세요",
	        	icon:"error",	        	        	
	        	confirmButtonText: "확인"  	        	
	        });		
	}else {
		const login_btn = document.getElementById('btn-login-body');
		
		login_btn.disabled = false;
	}
}

function sendIt() {
    const email = document.querySelector('.email-login-body').value;

    if (email.indexOf('@') == -1 || email.indexOf('.') == -1) {
        Swal.fire({
	        	title:"로그인 실패",
	        	text:"이메일을 확인해주세요",
	        	icon:"error",	        	        	
	        	confirmButtonText: "확인"  	        	
	        });		
    } else {
        const password_txt = document.querySelector('.password-login-body');
        password_txt.style.display = 'block';

        const checkBtn = document.getElementById('checkBtn-login-body');
        checkBtn.style.display = 'none';

        const loginBtn = document.getElementById('loginBtn-login-body');
        loginBtn.style.display = 'block';

        /* sessionStorage.setItem('s_email', email);

        const mariadb = require('mariadb');

        const pool = mariadb.createPool({
            host: 'localhost',
            port: '3306',
            user: 'root',
            password: '1231',
            database: 'tindog',
            connectionLimit: 5 // 필요에 따라 조절
        });

        pool.getConnection()
            .then(conn => {
                const query = 'SELECT * FROM MEMBER WHERE EMAIL = ?';
                return conn.query(query, [email])
                    .then(rows => {
                        alert(JSON.stringify(rows));
                        conn.release(); // 연결 해제
                    })
                    .catch(err => {
                        throw err;
                    });
            })
            .catch(err => {
                throw err;
            }); */
    }
}