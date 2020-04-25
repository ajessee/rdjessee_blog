let showRecorderButton = document.querySelector('#show-recorder');

if (showRecorderButton) {
  showRecorderButton.onclick = function() {
    showRecorderButton.style.display = "none";
  
    let recordButton = document.querySelector('#start-audio-recorder');
    let stopButton = document.querySelector('#stop-audio-recorder');
    let containerDiv = document.querySelector('#audio-recorder');
    let audioButtonsContainer = document.querySelector('#recording-buttons');
    let submitRecordingButton = document.querySelector('#submit-recording-button');
  
    containerDiv.style.display = "inline-block";
    submitRecordingButton.style.display = "none";
  
    if (navigator.mediaDevices) {
        console.log('getUserMedia supported.');
      
        var constraints = { audio: true };
        var chunks = [];
      
        navigator.mediaDevices.getUserMedia(constraints)
        .then(function(stream) {
      
          var mediaRecorder = new MediaRecorder(stream);
      
          recordButton.onclick = function() {
            let existingAudio = document.querySelectorAll('div.audio-clip > audio');
            if (existingAudio.length) {
              document.querySelector('#delete-audio-button').click();
            }
            recordButton.textContent = "Recording";
            audioButtonsContainer.classList.add('fixed-audio-buttons');
            recordButton.classList.add('recording-pulse');
            stopButton.removeAttribute('disabled');
            stopButton.style.display = "inline-block";
            document.documentElement.scrollTop = 0
            mediaRecorder.start();
            console.info(mediaRecorder.state);
            console.info("Audio Recorder Started");
          }
      
          stopButton.onclick = function() {
            containerDiv.scrollIntoView();
            audioButtonsContainer.classList.remove('fixed-audio-buttons');
            recordButton.classList.remove('recording-pulse');
            stopButton.disabled = true;
            stopButton.style.display = "none";
            recordButton.textContent = "Start New Recording";
            mediaRecorder.stop();
            console.info(mediaRecorder.state);
            console.info("Audio Recorder Stopped");
          }
  
          submitRecordingButton.onclick = async function(e) {
            e.preventDefault();
            let submitRecordingForm = document.querySelector('#new_recording');
            let formData = new FormData(submitRecordingForm);
            let existingAudio = document.querySelectorAll('div.audio-clip > audio')[0];
            let audioUrl = existingAudio.src;
            let recordingCaption = document.querySelector('#recording-caption').textContent;
            try {
                await fetch(audioUrl).then(r => r.blob()).then(function(blob) {
                    formData.append('recording[audio_file]', blob); 
                    formData.append('recording[caption]', recordingCaption); 
                })
            } catch (err) {
                console.info("what")
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
  
            submitRecordingButton.style.display = "inline-block";
      
            var audioClipName = prompt('Please enter a title for your recording. Preferably in the format of: "[Your Name]\'s reading of "[Title Of Story]" ');
      
            var audioContainer = document.createElement('div');
            var audioClipLabel = document.createElement('p');
            audioClipLabel.setAttribute('id', 'recording-caption');
            var audio = document.createElement('audio');
            var deleteButton = document.createElement('button');
            deleteButton.classList.add('btn', 'btn-danger');
            deleteButton.setAttribute('id', 'delete-audio-button');
           
            audioContainer.classList.add('audio-clip');
            audio.setAttribute('controls', '');
            deleteButton.innerHTML = "Delete Current Recording";
            audioClipLabel.innerHTML = audioClipName;
            audioClipLabel.setAttribute('contenteditable', true)
      
            audioContainer.appendChild(audio);
            audioContainer.appendChild(audioClipLabel);
            audioButtonsContainer.appendChild(deleteButton);
            audioButtonsContainer.appendChild(audioContainer);
      
            audio.controls = true;
            var blob = new Blob(chunks, { 'type' : 'audio/ogg; codecs=opus' });
            chunks = [];
            var audioURL = URL.createObjectURL(blob);
            audio.src = audioURL;
            console.info("recorder stopped");
      
            deleteButton.onclick = function(e) {
              let userConfirm = confirm("This will delete the current recording. You sure you want to do that?");
              if (userConfirm) {
                submitRecordingButton.style.display = "none";
                audioContainer.remove();
                deleteButton.remove();
              }
            }
          }
      
          mediaRecorder.ondataavailable = function(e) {
            chunks.push(e.data);
          }
        })
        .catch(function(err) {
          alert("We are unable to access the microphone. Please allow access and try again. Error:" + err)
        })
      } else {
        alert("Your browser does not have the ability to record audio.")
      }
  }
}


