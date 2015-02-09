//
//  ViewController.swift
//  MayoPod
//
//  Created by Grayson Wilkins on 2/5/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var songNameField: UITextField!
    @IBOutlet weak var artistNameField: UITextField!
    @IBOutlet weak var albumNameField: UITextField!
    @IBOutlet weak var composerField: UITextField!
    @IBOutlet weak var lengthField: UISlider!
    @IBOutlet weak var buttonSong: UIButton!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelLength: UILabel!
    @IBOutlet weak var labelArtist: UILabel!
    @IBOutlet weak var labelAlbum: UILabel!
    @IBOutlet weak var labelComposer: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelMinutes: UILabel!
    @IBOutlet weak var buttonAlphabetical: UIButton!
    @IBOutlet weak var buttonArtist: UIButton!
    @IBOutlet weak var displayText: UITextView!
    @IBOutlet weak var buttonRemove: UIButton!
    @IBOutlet weak var errorTextView: UITextView!
    @IBOutlet weak var yearPicker: UIPickerView!
    
    var years = ["1850","1851","1852","1853","1854","1855","1856","1857","1858","1859","1860","1861","1862","1863","1864","1865","1866","1867","1868","1869","1870","1871","1872","1873","1874","1875","1876","1877","1878","1879","1880","1881","1882","1883","1884","1885","1886","1887","1888","1889","1890","1891","1892","1893","1894","1895","1896","1897","1898","1899","1900","1901","1902","1903","1904","1905","1906","1907","1908","1909","1910","1911","1912","1913","1914","1915","1916","1917","1918","1919","1920","1921","1922","1923","1924","1925","1926","1927","1928","1929","1930","1931","1932","1933","1934","1935","1936","1937","1938","1939","1940","1941","1942","1943","1944","1945","1946","1947","1948","1949","1950","1951","1952","1953","1954","1955","1956","1957","1958","1959","1960","1961","1962","1963","1964","1965","1966","1967","1968","1969","1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"]
    
    func numberOfComponentsInPickerView (yearPicker:UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(yearPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return years.count
    }
    
    func pickerView(yearView: UIPickerView, titleForRow row:Int, forComponent component:Int) -> String!{
        return years[row]
    }
    
    //UIPickerViewDelegate *delegate = yearPicker.delegate;
    //NSString *year = [delegate yearPicker
    
    
    @IBAction func toggleSongList(sender: UISegmentedControl) {
        errorTextView.text = ""
        refreshUI()
        if sender.selectedSegmentIndex == 1{
            songNameField.hidden = true
            artistNameField.hidden = true
            albumNameField.hidden = true
            composerField.hidden = true
            lengthField.hidden = true
            buttonSong.hidden = true
            labelName.hidden = true
            labelAlbum.hidden = true
            labelArtist.hidden = true
            labelComposer.hidden = true
            labelLength.hidden = true
            labelYear.hidden = true
            labelMinutes.hidden = true
            buttonAlphabetical.hidden = false
            buttonArtist.hidden = false
            buttonRemove.hidden = true
            displayText.hidden = false
        }
        else{
            songNameField.hidden = false
            artistNameField.hidden = false
            albumNameField.hidden = false
            composerField.hidden = false
            lengthField.hidden = false
            buttonSong.hidden = false
            labelName.hidden = false
            labelArtist.hidden = false
            labelComposer.hidden = false
            labelLength.hidden = false
            labelAlbum.hidden = false
            labelYear.hidden = false
            labelMinutes.hidden = false
            buttonAlphabetical.hidden = true
            buttonArtist.hidden = true
            buttonRemove.hidden = false
            displayText.hidden = true
        }
    }
    var songList: [Song] = []
    
    @IBAction func addButton(sender : AnyObject){
        let songName = String(songNameField.text as NSString)
        let songArtist = String(artistNameField.text as NSString)
        let songAlbum = String(albumNameField.text as NSString)
        let songComposer = String(composerField.text as NSString)
        let songLength = Int(lengthField.value)

            
        let newSong = Song(name:songName, artist:songArtist, album:songAlbum, composer:songComposer, length:songLength, year: "2015")
        var alreadyEntered = false
        for i in songList {
            if i.getSongName() == songName{
                if i.getArtistName() == songArtist{
                    // error statement
                    alreadyEntered = true
                }
            }
        }
        refreshUI()
        if alreadyEntered == false{
            
            songList.append(newSong)
            errorTextView.text = "Song has been added."
        } else {
            errorTextView.text = "This song has already been entered."
        }
    }
    
    @IBAction func removeButton(sender: UIButton) {
        let songName = String(songNameField.text as NSString)
        let songArtist = String(artistNameField.text as NSString)
        let songAlbum = String(albumNameField.text as NSString)
        let songComposer = String(composerField.text as NSString)
        let songLength = Int(lengthField.value)
        let songYear = "2015"
        var count = 0
        
        for i in songList {
            i.getSongName()
            
            if i.getSongName() == songName {
                if i.getArtistName() == songArtist{
                    removeSong(count)
                }
            }
            count++
        }
        refreshUI()
    }
    
    func removeSong(songIndex: Int) {
        songList.removeAtIndex(songIndex)
    }
    
    
    @IBAction func displayArtist(sender: UIButton) {
        var results = ""
        for i in songList{
            results += "\(i.getSongName()), by \(i.getArtistName()), in \(i.getSongYear())\n"
        }
        displayText.text = results
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonAlphabetical.hidden = true
        buttonArtist.hidden = true
        displayText.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        songNameField.resignFirstResponder()
        artistNameField.resignFirstResponder()
        albumNameField.resignFirstResponder()
        composerField.resignFirstResponder()
    }
    
    
    func addSong() {
        let songName = String(songNameField.text as NSString)
        let songArtist = String(artistNameField.text as NSString)
        let songAlbum = String(albumNameField.text as NSString)
        let songComposer = String(composerField.text as NSString)
        let songLength = Int(lengthField.value)
        
        let newSong = Song(name:songName, artist:songArtist, album:songAlbum, composer:songComposer, length:songLength, year:"2015")
        
        var alreadyEntered = false
        for i in songList {
            if i.getSongName() == songName{
                if i.getArtistName() == songArtist{
                    // error statement
                    alreadyEntered = true
                }
            }
        }
        if alreadyEntered == false{
            songList.append(newSong)
        } else {
            errorTextView.text = "You fucked up, John."
        }
        
    }

    func refreshUI(){
        songNameField.text = ""
        albumNameField.text = ""
        composerField.text = ""
        lengthField.value = 210
        artistNameField.text = ""
        
    }
}
