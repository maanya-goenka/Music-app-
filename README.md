# Music-app-
A basic version of spotify that uses table view cells and different types of view controllers to create a list of songs, 
the details of which can be edited and saved

The goal is to create a UITableView with custom cells that we can use to display a playlist of
songs. I created a custom cell with an image, song name, artist name and album name. I reused table view cells (using 
dequeueReusableCell(withIdentifier:)), and created my custom cells by subclassing UITableViewCell.
We also need the ability to edit the songs in the playlist. We should be able to change the song
name, artists name and album name. This can be done by using a detail view that appears when
you tap on a cell. When you dismiss the detail view, the song should update with the changed
information (hint: use a delegate here). Reloading a tableview can be done with tableView.reloadData().
I used the Modal View Controller paradigm but I could have used navigation view controllers as well with an additional right 
bar button called 'SAVE'. 
