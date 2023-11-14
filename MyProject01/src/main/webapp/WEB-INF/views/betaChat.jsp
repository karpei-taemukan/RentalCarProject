<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="${pageContext.request.contextPath }/resources/users/css/reset.css"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap"
	rel="stylesheet">
<title>Speak Chat</title>
<style>
html {
	font-size: 20px;
}

body {
	overflow: scroll;
	font-family: 'Oswald', sans-serif;
	font-size: 24px;
}

.chat {
	
}

.nextMsg {
	display: block;
}

body {
	background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
	background-size: 400% 400%;
	animation: gradient 15s ease infinite;
	height: 100vh;
}

.btns {
	position: sticky;
	top: 90%;
	display: flex;
	justify-content: center;
}

.btn {
	width: 130px;
	height: 40px;
	background: linear-gradient(0deg, rgb(248, 182, 45) 0%,
		rgba(182, 255, 237) 100%);
	margin-right: 5rem;
	border-radius: 50%;
	border: none;
}

.btn:hover {
	background: linear-gradient(0deg, rgb(100, 252, 201) 0%,
		rgba(227, 255, 63) 100%);
}

@
keyframes gradient { 0% {
	background-position: 0% 50%;
}

50
%
{
background-position
:
100%
50%;
}
100
%
{
background-position
:
0%
50%;
}
}
.response {
	border-radius: 20px 20px 0px 20px;
	text-align: center;
	margin-bottom: 1%;
	width: 20%;
	max-width: 300px;
	max-height: 700rem;
	display: block;
	background-color: white;
	margin-left: auto;
	padding: 5px;
    margin-right: 10px;
    background: yellow;
}
.input {
	border-radius: 0px 20px 20px 20px;
	text-align: center;
	margin-bottom: 1%;
	width: 20%;
	max-width: 300px;
	max-height: 700rem;
	display: block;
	background-color: white;
	padding: 5px;
    margin-left: 10px;
}
</style>
</head>

<body>

	<div class="chat">
			
		
	</div>
	<div class="btns">
		<button id="start" class="btn">
			<span>Start</span>
		</button>
		<button id="end" class="btn">
			<span>End</span>
		</button>
	</div>
</body>

<script>

    let question = document.querySelector(".question");
    let answer = document.querySelector(".answer");

    let nextMsg = document.querySelector(".chat");

    var recognition = new webkitSpeechRecognition();
    var speechRecognitionList = new webkitSpeechGrammarList();
    recognition.grammars = speechRecognitionList;
    recognition.lang = 'ko-KR';
    recognition.interimResults = false;
    recognition.maxAlternatives = 10;

</script>

<script>
    const body = document.querySelector("body");
    const start = document.querySelector("#start");
    const end = document.querySelector("#end");
    // let speech = null;
    //const OPEN_AI_KEY = "sk-9UhWZUySLPXDN5elAqTkT3BlbkFJQcJCzD8T1V0faU8wAB0K11drdffsdf";
    // const OPEN_AI_KEY = "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";
    const OPEN_AI_KEY = "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";
    start.addEventListener("click", () => {

        recognition.start();
    })
    recognition.addEventListener("result", (e) => {
        let speak = e.results[0][0].transcript.toLowerCase();
        //console.log(e)
        //console.log(e.results[0][0].transcript.length);
        //console.log(typeof(e.results[0][0].transcript))
        //console.log(OPEN_AI_KEY);
        let qmsg = document.createElement("div");
        qmsg.innerText = e.results[0][0].transcript.replace(".", "").toLowerCase();
       /*  qmsg.style.borderTopLeftRadius = "20px";
        qmsg.style.borderTopRightRadius = "20px";
        qmsg.style.borderBottomRightRadius = "20px"; */
        qmsg.classList.add("input");
       /*  qmsg.style.textAlign = "center";
        qmsg.style.marginBottom = "10%";
        qmsg.style.marginLeft = "10%";
        qmsg.style.maxWidth = "500rem";
        qmsg.style.maxHeight = "700rem";
        qmsg.style.display = "block";
        qmsg.style.backgroundColor = "white"; */
        nextMsg.appendChild(qmsg);


        fetch("https://api.openai.com/v1/chat/completions", {
            method: "POST",
            headers: {
                "Authorization": 'Bearer' + " " + OPEN_AI_KEY,
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                model: "gpt-3.5-turbo",
                messages: [{ role: "user", content: speak }],
            }),

        }).then((res) => res.json())
            .then((data) => {
                let plusMargin = 0;
                plusMargin += 10;

                let amsg = document.createElement("div");
                amsg.classList.add("response");
                amsg.innerText = data.choices[0].message.content;
                nextMsg.appendChild(amsg);
            });

        // if(e.results[0][0].transcript.toLowerCase().endsWith(".")){
        //     e.results[0][0].transcript.slice(e.results[0][0].transcript.length)
        //     console.log(e.results[0][0].transcript.replace(".",""))
        //    
        // }
        // question.innerText=e.results[0][0].transcript.replace(".","").toLowerCase();


        // if(speech === "google"){
        //   const link = document.createElement("a");
        //   console.log(link)
        //   link.innerText="google";
        //   link.href="https://google.com";
        //   body.appendChild(link);
        //     //location.href="https://google.com";
        // }
        // if(speech === "blue"){
        //     body.style.background ="blue";
        // }

    })




</script>
<script>
    end.addEventListener("click", () => {
        recognition.stop();
    })

</script>

<script>
    recognition.addEventListener("error", (e) => {
        answer.innerText = "speech again";
    })
</script>

</html>