        	let real_input = document.getElementById("senddate");
        	let fake_Input = document.getElementById("showdate");
        	const d = ['2023-10-27','2023-10-28','2023-10-29'];
        	
        	let open_calander = document.getElementById("open_Calander");
	        let flatpickrInstance = flatpickr(open_calander, {
	            mode: 'multiple',
	            dateFormat: 'Y-m-d',
	           /* enable: [...d] */
	            onChange: function(selectedDates, dateStr, instance) {
	              console.log("Selected dates: ", selectedDates.map(date => formatDate(date)));
	              if(selectedDates.length > 0){
	                  let minDate = selectedDates.reduce((a, b) => a < b ? a : b);
	                  let maxDate = selectedDates.reduce((a, b) => a > b ? a : b);
	                  let selectedDate = selectedDates;
	                  fake_Input.value = formatDate(minDate) + " ~ " + formatDate(maxDate);
	                  real_input.value = selectedDates.map(date => formatDate(date));
	              } else {
	            	  fake_Input.value = "";
	            	  real_input.value = "";
	              }
	            },
	        });

	        function formatDate(date) {
	            let year = date.getFullYear();
	            let month = (date.getMonth() + 1 < 10 ? '0' : '') + (date.getMonth() + 1);
	            let day = (date.getDate() < 10 ? '0' : '') + date.getDate();
	            return year + '-' + month + '-' + day;
	          }
	        