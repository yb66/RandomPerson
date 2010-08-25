module RandomPerson
  module Names

    class WelshLast < Name
      
      def initialize
        @formats = {
          :single =>                      ->(n)   { n.rand },
          :double_barrelled_hyphenated => ->(n)   { n.rand + '-' + n.rand },
         }
         
        @formats_ratiod = [ (0..99) ]
        setupnames
      end
  
      def setupnames
        @names = %w{ Ace Adams Adda Ajax Alban Allen Andrew Anthony Anwyl Arthur Ashton Astley Augustus Austin Awbrey Bach Bamford Barry Baskerville Bateman Baugh Bebb Bedward Beedle Belth Benbow Bengough Benjamin Bennett Bevan Beynon Bidder Blackwell Blayney Bonner Bonsall Boulter Bound Bowdler Bowen Bown Brace Breese Brigstocke Brooks Brown Bufton Bulkeley Button Bythell Caddock Cadogan Cadwalader Cantington Canton Cardiff Cardigan Carew Charles Christmas Clayton Clement Clocker Clougher Cole Connah Conway Coslett Craddock Crowther Crunn Cunnick Daniel David Dawkins Deere Devonald Dodd Edmunds Edwards Elias Ellis Emanuel Ephraim Esau Evans Eynon Faithfull Felix Fenna Folland Foulkes Francis Gabriel Gadarn Games Geonor George Gethin Gibbs Gittins Goodwin Gough Gravenor Griffiths Gronow Gunter Guy Gwalchmai Gwilt Gynne Gwyther Haines Hall Hamer Harries Harry Hatfield Hathaway Havard Heilyn Herbert Hier Hooson Hopkins Hoskin Howard Howe Howells Hughes Hullin Humphreys Husband Hussey Issac Ithell Jacob James Jarman Jasper Jeffreys Jehu Jervis Job John Jones Joseph Kendrick Kinsey Kneath Knethell Kyffin Landeg Laugharne Lewis Leyshon Llewelyn Lloyd Llywarch Lodwick Lougher Lucas Lumley Mabe Maddocks Mason Matthews Maybery Mendus Meredith Meyler Meyrick Michael Miles Mills Morgan Morris Mortimer Mostyn Nanney Narberth Nash Nevett Newell Nicholas Nock Nuttall Oliver Owen Parker Parry Pask Paskin Peate Peregrine Perkins Peters Phillips Picton Pierce Powell Price Pritchard Probert Probyn Profit Prosser Prothero Pugh Rees Reynolds Rhydderch Richards Roberts Roch Roderick Rogers Rowlands Salmon Salusbury Sambrook Samuel Savage Sayce Sheen Sheldon Smith Smout Stephens Stradling Swancott Tannatt Taylor Teague Tew Thomas Tibbot Timothy Treharne Trevor Trewent Trow Tucker Tudor Turner Vaughan Voyle Walbeoff Walters Warlow Warren Watkins Watts Weal Weaver Whittal Wigley Wild Wilding Williams Wogan Woosencraft Woosnam Worthing Wynne Yorath Young Yong Yonge Yongue }
      end
    end    
  end
end

