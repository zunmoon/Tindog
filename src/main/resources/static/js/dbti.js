class Dbti {
	constructor(target) {
		this.container = document.querySelector(target); // 추후 dom 내용을 바꾸기 위한 선택자
		this.page = 0; // 0: intro, 1: test, 2: result 현재 페이지
		this.progress = 0; // 현재 질문 단계
		this.questions = {
			EI: [
				{
					question: '다른 강아지 친구들을 만났을 때, 나의 반응은?',
					answer: { a: '근처도 오지마라 으르렁', b: '새친구 좋다멍!' },
				},{
					question: '집사가 쉬는 날! 집사와의 데이트 장소는?',
					answer: { a: '나는 집,집,집! 집이좋아', b: '하루 전부터 두근두근! \n 나갈 준비 완료' },
				},{
					question: '지나가는 인간이 나를 본다면?',
					answer: { a: '저리가라 인간..(질끈)', b: '나 진짜 귀엽지? 친구하자!' },
				},
			],
			NS: [
				{
					question: '눈 앞에서 집사가 사라진다면?',
					answer: { a: '방금까지 있었는데... \n 나는 내 할 일 하련다!', b: '또 시작이네, \n 여기저기 찾으러 가자!' },
				},{
					question: '산책할 때의 나는?',
					answer: { a: '거참.. 아는 길로 가자 집사야', b: '저 나비를 쫓아가볼까? 왈왈멍멍' },
				},{
					question: '새로운 장난감이 생긴다면?',
					answer: { a: '넌 뭐야! 정체를 밝혀라 \n 약 3초 관심 후 관심 끝!', b: '나의 왕국에 온 것을 환영해 \n 너는 나의 베스트 장난감' },
				},
			],
			FT: [
				{
					question: '집사가 간식을 들고 처음 보는 훈련을 시도한다?!',
					answer: { a: '뭐해?ㅡㅡ(지켜본다)', b: '킁킁 맛있는 냄새! \n 일단 따라하고 본다' },
				},{
					question: '친구 멍이 같이 사고를 치자고 날 꼬신다면?',
					answer: { a: '주인한테 혼날거야 난 뺴줘 멍~', b: '나는야 날라리멍, \n 사고는 치라고 있는 것!' },
				},{
					question: '집사와 간식 중에 선택해야 한다면?',
					answer: { a: '하찮은 간식 치워! \n 집사가 최고다멍', b: '나의 Pick은 간식이지롱' },
				},
			],
			JP: [
				{
					question: '집사가 외출한다면 나는...?',
					answer: { a: '갔냐? 왈왈 내가 왕이다', b: '진짜 간거야? 확인하고 기다린다' },
				},{
					question: '산책 중 화장실이 급하다',
					answer: { a: '참지 않고 바로 쏴-아', b: '마킹한 곳을 찾아 배변한다!' },
				},{
					question: '자동 급식기를 집사가 사왔다',
					answer: { a: '뷔페가.. 요기잉네?^__^', b: '아침 점심 저녁! \n 정확하게 나눠 먹겠어' },
				},
			]
		}; // 질문 모음
		this.results = []; // 사용자가 선택한 답모음
		this.init();
	}

	init() {
		this.questionArray = this.getQuestion();

		const answerAButton = this.container.querySelector('button[data-answer="a"]');
        const answerBButton = this.container.querySelector('button[data-answer="b"]');
        const startButton = this.container.querySelector('button[data-action="start"]');
        const restartButton = this.container.querySelector('button[data-action="restart"]');		

        answerAButton.addEventListener('click', () => this.submitAnswer(answerAButton.innerText));
        answerBButton.addEventListener('click', () => this.submitAnswer(answerBButton.innerText));
        startButton.addEventListener('click', this.start.bind(this));
        restartButton.addEventListener('click', this.restart.bind(this));		
		
		this.render();

	} // 질문을 배열로 저장

	start() {
		if (this.progress !== 0) return; // 진행중이면 실행하지 않음
		this.page = 1;
		this.render();
	}
	
	restart() {
		this.page = 1;
		this.progress = 0;
		this.results = [];
		this.render();
	}
	
	getQuestion() {
		return Object.entries(this.questions)
        .flatMap(([type, questions]) => questions.map(question => ({ ...question, type })));
	}

	getCurrentQuestions() { // 현재 progress의 질문을 반환
		const currentQuestionIndex = this.progress;
        return this.questionArray[currentQuestionIndex];
	}

	submitAnswer(answer) {
		const currentQuestion = this.questionArray[this.progress];

        if (this.questionArray.length <= this.progress + 1) {
            this.page = 2;
            this.render();
        }

        const selectedAnswer = Object.keys(currentQuestion.answer)
        .find(selectedAnswer => currentQuestion.answer[selectedAnswer] === answer);

        this.results.push({
            type: currentQuestion.type,
            answer: selectedAnswer
        });

        this.progress++;
        this.render();

        return this.getCurrentQuestions();
	}

	calcResult() {
		const totalResult = Object.keys(this.questions).reduce((acc, cur) => {
			acc[cur] = this.results
				.filter(result => result.type === cur)
				.reduce((acc, cur) => {
					acc[cur.answer] = acc[cur.answer] ? acc[cur.answer] + 1 : 1;
					return acc;
				}, {});
			return acc;
		}, {});

		return this.createPersonalResult(totalResult);
	}

	createPersonalResult(totalResult) {
		return Object.keys(totalResult).reduce((acc, cur) => {
            const result = totalResult[cur];

            if (!result.a) return acc + cur[0];
            if (!result.b) return acc + cur[1];

            if (result.a === result.b) {
                return acc + cur[0];
            }

            return acc + (result.a > result.b ? cur[1] : cur[0]);
        }, "");
	}

	render() {
		const introContainer = this.container.querySelector('.intro_container');
        const testContainer = this.container.querySelector('.test_container');
        const resultContainer = this.container.querySelector('.result_container');

        if (this.page === 0) {
            introContainer.classList.add('active');
            testContainer.classList.remove('active');
            resultContainer.classList.remove('active');

        } else if (this.page === 1) {
            testContainer.classList.add('active');
            introContainer.classList.remove('active');
            resultContainer.classList.remove('active');

            const progressElement = this.container.querySelector('.progress');
            const questionElement = this.container.querySelector('.question');
            const answerAElement = this.container.querySelector('button[data-answer="a"]');
            const answerBElement = this.container.querySelector('button[data-answer="b"]');

            progressElement.textContent = `Q${this.progress + 1}. `;
            questionElement.textContent = this.getCurrentQuestions().question;
            answerAElement.textContent = this.getCurrentQuestions().answer.a;
            answerBElement.textContent = this.getCurrentQuestions().answer.b;

        } else if (this.page === 2) {
            resultContainer.classList.add('active');
            introContainer.classList.remove('active');
            testContainer.classList.remove('active');

            const resultTextElement = this.container.querySelector('.result_text');            
            const calcResult = this.calcResult();

            resultTextElement.innerHTML = `<span class="exp">멍BTI 결과는 </span><span class="point_text">${calcResult}</span><span class="exp">입니다.</span>`;
           
           localStorage.setItem("멍BTI 결과", calcResult);
           const data=localStorage.getItem("멍BTI 결과"); 
           
           document.getElementById('data').value=data;
        }
                
    }
        
}
