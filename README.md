# TonganHymns
Xcode 7 to display song titles in two languages (Tongan and English subtitles) and display songs in PDF or HTML format.

Being new to developing on an iOS platform, I found plenty of resources to help me build a simple app that
searches a list of song titles in two different languages and display the song in either pdf or html formats.
I decided to use as an example, a list of song
titles from a church hymn book.  I used song titles in Tongan with English subtitles.  Tonga is a small
country in the South Pacific Polynesian Islands.

I found that some characters in Tongan may
have an accent, so it may be difficult to search by this character.  I decided to add another field
called "searchname" in the TitleList array that removed any special characters, so when someone searches for a certain word,
they would be able to find a match without typing the accent.

I then gave the user the ability to display these songs in either pdf or html formats by using the "Settings" page.  It
is possible that some songs may not be available in pdf or html formats, so I added a generic html page to give
notice to the user that these format pages are not available.  I know I could have used the same pdf and html file for
all the song titles in this demo, but I wanted to just show how it would look with 200+ pdf and html files.

I searched many sites to code the app in swift and to get something that works, let alone compile.  I should give credit
where credit is due, I used code from Andy Pereira for the UISearchController and watched really good youtube videos from
Jared Davidson.  Thanks guys.

I hope to pass on things I learned to others.  Enjoy.

-Jeff

