
jQuery(document).ready(function ($) {
	$('#load_more').click(function(e){
		alert("The Data will be appended on this event");
		e.preventDefault();
	});
	$("#starMakkah_list option:first").attr('selected', 'selected');
	var starMakkah_list = $('select[id$="starMakkah_list"]');
	selectHotelMakkah(starMakkah_list);
	$("#starMadina_list option:first").attr('selected', 'selected');
	var starMadina_list = $('select[id$="starMadina_list"]');
	selectHotelMadina(starMadina_list);
	//document.getElementById('input[id$="month_txt"').valueAsDate = new Date();

	$("#airLine_list option:first").attr('selected', 'selected');
	var airLine_list = $('select[id$="airLine_list"]');
	AirLineChange(airLine_list);
	$("#depAirLine_list option:first").attr('selected', 'selected');
	var depAirLine_list = $('select[id$="depAirLine_list"]');
	depAirLineChange(depAirLine_list);
	$("#retAirLine_list option:first").attr('selected', 'selected');
	var retAirLine_list = $('select[id$="retAirLine_list"]');
	retAirLineChange(depAirLine_list);

	$('input[id$="monthSelected"]').click(function () {
	    var mon = $('input[id$="month_txt"] ').val();
	    if (mon == "")
	    {
	        //this.disabled = true;
	        alert("Select Month");
	        return false;
	    }
	});

	$('input[id$="hotelmakkahSelected"]').click(function () {
	    var hotel = $('select[id$="hotelMakkah_list"] option:selected').val();
	    var room = $('select[id$="roomMakkah_list"] option:selected').val();
	    var nights = $('input[id$="nightsMakkah"] ').val();
	    console.log(hotel, room, nights);
	    if (hotel == undefined || room == undefined || nights == ""){
	    alert("All Fields Required");
	    return false;
    }
	    });
	$('input[id$="selectMadina"]').click(function () {
	    var hotel = $('select[id$="hotelMadina_list"] option:selected').val();
	    var room = $('select[id$="roomMadina_list"] option:selected').val();
	    var nights = $('input[id$="nights_madina"] ').val();
	    console.log(hotel, room, nights);
	    if (hotel == undefined || room == undefined || nights == "") {
	        alert("All Fields Required");
	        return false;
	    }
	});



	$('input[id$="airline_btn"]').click(function () {
	    var oneWay = $('input[id$="oneWay_chk"] ');
        //Check all fields selected
	    if (oneWay[0].checked) {
	        
	        var airLine = $('select[id$="departureAirLine_list"] option:selected').val();
	        var flight = $('select[id$="depFlight_list"] option:selected').val();
	        var airLine2 = $('select[id$="returnAirLine_list"] option:selected').val();
	        var flight2 = $('select[id$="retFlight_list"] option:selected').val();
	        if (airLine == undefined || flight == undefined || airLine2 == undefined || flight2 == undefined) {
	            alert("All Fields Required");
	            return false;
	        }
	    }
	    else {
	        var airLine = $('select[id$="airLine_list"] option:selected').val();
	        var flight = $('select[id$="flight_list"] option:selected').val();
	        if (airLine == undefined || flight == undefined) {
	            alert("All Fields Required");
	            return false;
	        }
	    }
	    var mon = $('input[id$="month_txt"] ').val();
	    var d = new Date(mon);

	    if (!!d.valueOf()) {
	        month = d.getMonth() + 1;
	    }
	    var totel_price = $('span[id$="totalamount"] ');
	    var totelPrice = 0;
	    var x =$.grep(visaData, function (n, i) {
	        return n.Month == month;

	    });
	    var priceMadina = $('span[id$="priceMadina"] ').text();
	    var priceMakkah = $('span[id$="priceMakkah"] ').text();
	    var nightsMadina = $('input[id$="nights_madina"] ').val();
	    var nightsMakkah = $('input[id$="nightsMakkah"] ').val();
	    totelPrice = (priceMadina * nightsMadina) + (priceMakkah * nightsMakkah) + x[0].amount;
	    //alert(nightsMakkah)
	    //console.log(totelPrice)
	    totel_price.html(totelPrice);
	})
	
});

function showPopupPanel()
{
    var data = document.getElementById("myModal");
    data.classList.add("in");
    data.style.display = "block";
}
function selectHotelMakkah(current) {
    var starMakkah_list = $('select[id$="starMakkah_list"] option:selected').val();
    var hotelMakkah_list = $('select[id$="hotelMakkah_list"] ');
    var starRating = $('span[id$="starMakkah"] ');
    starRating.html(starMakkah_list);
    var x = $.grep(hotelData, function (n, i) {
        return n.rating == starMakkah_list;

    }); hotelMakkah_list.html("");
    $.each(x, function () {

        console.log(this);
        hotelMakkah_list.append($("<option></option>").val(this['id']).html(this['hotelName']));
    });
    if (x != null) {
        $("#hotelMakkah_list option:first").attr('selected', 'selected');
        selectRoomsMakkah(hotelMakkah_list);
    }

}
function selectRoomsMakkah(current) {
    var hotel_list = $('select[id$="hotelMakkah_list"] option:selected').val();
    $('input[id$="hotelMakkahID"] ')[0].value = hotel_list;
    var hotelName = $('select[id$="hotelMakkah_list"] option:selected').text();
    var roomMakkah_list = $('select[id$="roomMakkah_list"] ');
    var hotel_name = $('span[id$="hotelMakkah_Name"] ');
    hotel_name.html(hotelName);
    var x = $.grep(roomsData, function (n, i) {

        return n.hotelID == hotel_list;

    }); console.log(x); roomMakkah_list.html("");
    $.each(x, function () {

        console.log(this);
        roomMakkah_list.append($("<option></option>").val(this['id']).html(this['Name']));
    });
    if (x != null) {
        $("#roomMakkah_list option:first").attr('selected', 'selected');
        showInfoMakkah(roomMakkah_list);
    }

}
function showInfoMakkah(current) {

    var room = $('select[id$="roomMakkah_list"] option:selected').val();
    $('input[id$="roomMakkahID"] ')[0].value = room;
    var x = $.grep(roomsData, function (n, i) {

        return n.id == room;

    });
    var price = $('span[id$="priceMakkah"] ');
    
    console.log(x[0]);
    if(!x.valueOf()){
        price.html(x[0].price);
    }

}
function selectHotelMadina(current) {
    var starMadina_list = $('select[id$="starMadina_list"] option:selected').val();
    var hotelMadina_list = $('select[id$="hotelMadina_list"] ');
    var starRating = $('span[id$="starMadina"] ');
    starRating.html(starMadina_list);
    var x = $.grep(hotelData, function (n, i) {
        return n.rating == starMadina_list;

    }); hotelMadina_list.html("");
    $.each(x, function () {

        console.log(this);
        hotelMadina_list.append($("<option></option>").val(this['id']).html(this['hotelName']));
    });
    if (x != null) {
        $("#hotelMadina_list option:first").attr('selected', 'selected');
        selectRoomsMadina(hotelMadina_list);
    }

}
function selectRoomsMadina(current) {
    var hotel_list = $('select[id$="hotelMadina_list"] option:selected').val();
    //alert(hotel_list)
    $('input[id$="hotelMadinaID"] ')[0].value = hotel_list;
    var hotelName = $('select[id$="hotelMadina_list"] option:selected').text();
    var roomMadina_list = $('select[id$="roomMadina_list"] ');
    var hotel_name = $('span[id$="hotelMadina_Name"] ');
    hotel_name.html(hotelName);
    var x = $.grep(roomsData, function (n, i) {

        return n.hotelID == hotel_list;

    }); console.log(x); roomMadina_list.html("");
    $.each(x, function () {

        console.log(this);
        roomMadina_list.append($("<option></option>").val(this['id']).html(this['Name']));
    });
    if (x != null) {
        $("#roomMadina_list option:first").attr('selected', 'selected');
        showInfoMadina(roomMadina_list);
    }

}
function showInfoMadina(current) {
    
    var room = $('select[id$="roomMadina_list"] option:selected').val();
    var x = $.grep(roomsData, function (n, i) {

        return n.id == room;

    });
    $('input[id$="roomMadinaID"] ')[0].value = room;
    var price = $('span[id$="priceMadina"] ');
    
    console.log(x[0]);
    if (!x.valueOf()) {
        price.html(x[0].price);
    }
}
function oneWayChanged(current)
{
    console.log($('div[id$="roundTrip_panel"] ')[0]);
    var roundTrip_panel = $('div[id$="roundTrip_panel"] ')[0];
    $('input[id$="isRoundTrip"] ')[0].value = !current.checked;
    var oneWay_panel = $('div[id$="oneWay_panel"] ')[0];
    if(current.checked){
        roundTrip_panel.style.display = "none";
        oneWay_panel.style.display = "block";
    }
    else {
        roundTrip_panel.style.display = "block";
        oneWay_panel.style.display = "none";
    }
    var roundTrip_chk = $('input[id$="roundTrip_chk"] ').attr("checked", !current.checked);
    
}
function roundTripChanged(current)
{
    
    var roundTrip_panel = $('div[id$="roundTrip_panel"] ')[0];
    var oneWay_panel = $('div[id$="oneWay_panel"] ')[0];
    $('input[id$="isRoundTrip"] ')[0].value = current.checked;
    //chkbox.html(current.checked);
    if (current.checked) {
        roundTrip_panel.style.display = "block";
        oneWay_panel.style.display = "none";
    }
    else {
        roundTrip_panel.style.display = "none";
        oneWay_panel.style.display = "block";
    }
    var roundTrip_chk = $('input[id$="oneWay_chk"] ').attr("checked", !current.checked);
}
function AirLineChange(current)
{
    var val = $('select[id$="airLine_list"] option:selected').val();
    $('input[id$="airLineID"] ')[0].value = val;
    var x = $.grep(flightData, function (n, i) {

        return n.airLineID == val;

    }); 
    var flight_list = $('select[id$="flight_list"]'); flight_list.html("");
    $.each(x, function () {

        console.log(this);
        flight_list.append($("<option></option>").val(this['id']).html(this['Name']));
    });
    if (x != null) {
        $("#flight_list option:first").attr('selected', 'selected');
        FlightChange(flight_list);
    }

   
}
function depAirLineChange(current) {
    var val = $('select[id$="departureAirLine_list"] option:selected').val();
    $('input[id$="depAirLinID"] ')[0].value = val;
    var x = $.grep(flightData, function (n, i) {

        return n.airLineID == val;

    }); 
    var depFlight_list = $('select[id$="depFlight_list"]'); depFlight_list.html("");
    $.each(x, function () {

        console.log(this);
        depFlight_list.append($("<option></option>").val(this['id']).html(this['Name']));
    });
    if (x != null) {
        $("#depFlight_list option:first").attr('selected', 'selected');
        depFlightChange(depFlight_list);
    }
    
}
function retAirLineChange(current) {
    var val = $('select[id$="returnAirLine_list"] option:selected').val();
    $('input[id$="retAirLineID"] ')[0].value = val;
    var x = $.grep(flightData, function (n, i) {

        return n.airLineID == val;

    }); 
    var retFlight_list = $('select[id$="retFlight_list"]'); retFlight_list.html("");
    $.each(x, function () {

        console.log(this);
        retFlight_list.append($("<option></option>").val(this['id']).html(this['Name']));
    });
    if (x != null) {
        $("#retFlight_list option:first").attr('selected', 'selected');
        retFlightChange(retFlight_list);
    }
    
}
function depFlightChange(current)
{
    var val = $('select[id$="depFlight_list"] option:selected').val();
    $('input[id$="depFlight_id"] ')[0].value = val;
}
function retFlightChange(current) {
    var val = $('select[id$="retFlight_list"] option:selected').val();
    $('input[id$="retFlight_id"] ')[0].value = val;
}
function FlightChange(current) {
    var val = $('select[id$="flight_list"] option:selected').val();
    $('input[id$="flight_id"] ')[0].value = val;
}
function finallizeAmount()
{
    alert("here");
}