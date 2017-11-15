function positionEventsOnCalendar() {
    let eventGroups = document.getElementsByClassName("events-group");
    // for each day
    for(let i = 0; i < eventGroups.length; i++) {
        // for each event on given day
        let events = eventGroups[i].getElementsByClassName("single-event");
        let offset = 0;
        for(let j = 0; j < events.length; j++) {
            // retrieve start and end data
            let startHour = events[j].dataset.startHour;
            let startMinute = events[j].dataset.startMin;
            let endHour = events[j].dataset.endHour;
            let endMinute = events[j].dataset.endMin;
            // set height of block on calendar in pixels
            let height = (endHour - startHour + ((endMinute - startMinute) / 60)) * 30;
            events[j].style.height = height + "px";
            // set distance from top of parent
            let distance = (((startHour - 6) + (startMinute / 60)) * 30) - offset;
            events[j].style.transform = "translateY(" + distance + "px)";
            offset += height;
        }
    }
}

window.onload = positionEventsOnCalendar;