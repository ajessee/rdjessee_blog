let showRecorderButton = document.querySelector('#show-recorder');

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
          let existingAudio = document.querySelectorAll('article.clip > audio');
          if (existingAudio.length) {
              let userConfirm = confirm("By starting a new recording you will delete the old one. Are you sure?");
              if (userConfirm) {
                document.querySelector('#delete-audio-button').click();
              }
          }
          recordButton.textContent = "Recording";
          audioButtonsContainer.classList.add('fixed-audio-buttons');
          recordButton.classList.add('recording-pulse');
          stopButton.removeAttribute('disabled');
          stopButton.style.display = "inline-block";
          document.documentElement.scrollTop = 0
          mediaRecorder.start();
          console.log(mediaRecorder.state);
          console.log("recorder started");
        }
    
        stopButton.onclick = function() {
          containerDiv.scrollIntoView();
          audioButtonsContainer.classList.remove('fixed-audio-buttons');
          recordButton.classList.remove('recording-pulse');
          stopButton.disabled = true;
          stopButton.style.display = "none";
          recordButton.textContent = "Start New Recording";
          mediaRecorder.stop();
          console.log(mediaRecorder.state);
          console.log("recorder stopped");
        }

        submitRecordingButton.onclick = async function(e) {
          e.preventDefault();
          let submitRecordingForm = document.querySelector('#new_recording');
          let formData = new FormData(submitRecordingForm);
          let existingAudio = document.querySelectorAll('article.clip > audio')[0];
          let audioUrl = existingAudio.src;
          let recordingCaption = document.querySelector('#recording-caption').textContent;
          try {
              await fetch(audioUrl).then(r => r.blob()).then(function(blob) {
                  formData.append('recording[audio_file]', blob); 
                  formData.append('recording[caption]', recordingCaption); 
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

          submitRecordingButton.style.display = "inline-block";
    
          var clipName = prompt('Please enter a title for your recording. Preferably in the format of: "[Your Name]\'s reading of "[Title Of Story]" ');
    
          var clipContainer = document.createElement('article');
          var clipLabel = document.createElement('p');
          clipLabel.setAttribute('id', 'recording-caption');
          var audio = document.createElement('audio');
          var deleteButton = document.createElement('button');
          deleteButton.classList.add('btn', 'btn-danger');
          deleteButton.setAttribute('id', 'delete-audio-button');
         
          clipContainer.classList.add('clip');
          audio.setAttribute('controls', '');
          deleteButton.innerHTML = "Delete Current Recording";
          clipLabel.innerHTML = clipName;
    
          clipContainer.appendChild(audio);
          clipContainer.appendChild(clipLabel);
          audioButtonsContainer.appendChild(deleteButton);
          audioButtonsContainer.appendChild(clipContainer);
    
          audio.controls = true;
          var blob = new Blob(chunks, { 'type' : 'audio/ogg; codecs=opus' });
          chunks = [];
          var audioURL = URL.createObjectURL(blob);
          audio.src = audioURL;
          console.log("recorder stopped");
    
          deleteButton.onclick = function(e) {
            submitRecordingButton.style.display = "none";
            clipContainer.remove();
            deleteButton.remove();
          }
        }
    
        mediaRecorder.ondataavailable = function(e) {
          chunks.push(e.data);
        }
      })
      .catch(function(err) {
        console.log('The following error occurred: ' + err);
      })
    } else {
      alert("You'll need to allow us to use the microphone to enable this feature.")
    }
}
