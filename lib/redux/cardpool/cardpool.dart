class Cardpool {
    String title;
    int tournamentnum;
    int decknum;
    int standingsnum;
    int matchesnum;
    int dpnumber;
    int cyclenumber;

    Cardpool(
        {this.title,
        this.tournamentnum,
        this.decknum,
        this.standingsnum,
        this.matchesnum,
        this.dpnumber,
        this.cyclenumber});

    factory Cardpool.fromJson(Map<String, dynamic> json) {
        return Cardpool(
            title: json['title'],
            tournamentnum: json['tournamentnum'],
            decknum: json['decknum'],
            standingsnum: json['standingsnum'],
            matchesnum: json['matchesnum'],
            dpnumber: json['dpnumber'],
            cyclenumber: json['cyclenumber']
        );
    }
}