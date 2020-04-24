let recordButton = document.querySelector('#start-audio-recorder');

if (recordButton) {

    let stopButton = document.querySelector('#stop-audio-recorder');
    let containerDiv = document.querySelector('#audio-recorder');
    let submitRecordingButton = document.querySelector('#submit-recording-button');
    submitRecordingButton.style.display = "none";

    if (navigator.mediaDevices) {
        console.log('getUserMedia supported.');
      
        var constraints = { audio: true };
        var chunks = [];
      
        navigator.mediaDevices.getUserMedia(constraints)
        .then(function(stream) {
      
          var mediaRecorder = new MediaRecorder(stream);
      
          recordButton.onclick = function() {
            let existingAudio = document.querySelectorAll('article.clip > audio');
            if (existingAudio.length) {
                let userConfirm = confirm("By starting a new recording you will delete the old one. Are you sure?");
                if (userConfirm) {
                    existingAudio[0].parentElement.querySelector('button').click();
                }
            }
            mediaRecorder.start();
            console.log(mediaRecorder.state);
            console.log("recorder started");
            recordButton.style.background = "red";
            recordButton.style.color = "black";
          }
      
          stopButton.onclick = function() {
            mediaRecorder.stop();
            console.log(mediaRecorder.state);
            console.log("recorder stopped");
            recordButton.style.background = "";
            recordButton.style.color = "";
          }

          submitRecordingButton.onclick = async function(e) {
            e.preventDefault();
            let submitRecordingForm = document.querySelector('#new_recording');
            let formData = new FormData(submitRecordingForm);
            let existingAudio = document.querySelectorAll('article.clip > audio')[0];
            let audioUrl = existingAudio.src;
            try {
                await fetch(audioUrl).then(r => r.blob()).then(function(blob) {
                    formData.append('recording[audio_file]', blob); 
                })
            } catch (err) {
                console.log("what")
            } finally {
                $.ajax({
                    url: submitRecordingForm.getAttribute('action'),
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(data) {},
                    error: function(data) {}
                })         
            }
          }
      
          mediaRecorder.onstop = function(e) {
            console.log("data available after MediaRecorder.stop() called.");

            submitRecordingButton.style.display = "block";
      
            var clipName = prompt('Enter a name for your sound clip');
      
            var clipContainer = document.createElement('article');
            var clipLabel = document.createElement('p');
            var audio = document.createElement('audio');
            var deleteButton = document.createElement('button');
           
            clipContainer.classList.add('clip');
            audio.setAttribute('controls', '');
            deleteButton.innerHTML = "Delete";
            clipLabel.innerHTML = clipName;
      
            clipContainer.appendChild(audio);
            clipContainer.appendChild(clipLabel);
            clipContainer.appendChild(deleteButton);
            containerDiv.appendChild(clipContainer);
      
            audio.controls = true;
            var blob = new Blob(chunks, { 'type' : 'audio/ogg; codecs=opus' });
            chunks = [];
            var audioURL = URL.createObjectURL(blob);
            audio.src = audioURL;
            console.log("recorder stopped");
      
            deleteButton.onclick = function(e) {
              evtTgt = e.target;
              evtTgt.parentNode.parentNode.removeChild(evtTgt.parentNode);
            }
          }
      
          mediaRecorder.ondataavailable = function(e) {
            chunks.push(e.data);
          }
        })
        .catch(function(err) {
          console.log('The following error occurred: ' + err);
        })
      }
}