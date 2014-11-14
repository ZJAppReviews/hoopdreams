Group 6
Jeremy Bouzigard (EID: jdb2999)
Edgar Treto (EID: et6482)
Walid Owais (EID: wo783)

Beta Notes:
- Tips for execution: on simulator set Debug > Location > Apple
- Integrated Parse for backend data.
- Finished Create screen - adds new games to data model
- Finished Find screen - gets games nearby from data model
- Settings screen works, and changing search distance filters by distance
    - to debug set simulator location to (0,0)
    - note: settings screen doesn't save settings until you press done
- RSVP Screen not implemented yet (intended for final release)



Alpha Notes:

- The basic framwork for all the screens has been laid out to make their development a lot quicker. 
- The Create screeen is done, but is bottlenecked by the data model which is still in the progress of being defined. 
- The find page queries the data model and would list the games in the tables, but the data model is yet to be implemented.
- Having problems with gps data in simulator until you go to Debug > Location > and set a value.
- RSVP and Settings are yet to be coded out but the UI is done an viewable.
- The splash screen is yet to be shown, but it's design is completed in storyboard.
- At this stage, the general organization of the project is done which will make further developement much quicker. 