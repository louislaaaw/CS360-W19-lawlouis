using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_3
{
    enum Suit { Spade, Heart, Club, Diamond }; // suits
    class Card
    {
        public Suit suits { get; set; } 
        public int denomination { get; set; } 
        static Random rand = new Random(); // for drawing a random card
        public Card() //Constructor
        {
            suits = new Suit();
            denomination = 0;
        }
        public Card(Suit chosenSuit, int denom)
        {
            this.suits = chosenSuit;
            this.denomination = denom;
        }
        public Card RandomCard() // return a random card
        {
            int randomDenom = rand.Next(2, 15);
            var temp = Enum.GetValues(typeof(Suit));
            Suit randomSuit = (Suit)temp.GetValue(rand.Next(0, 4));
            Card tempCard = new Card(randomSuit, randomDenom);
            return tempCard;
        }
        public void PrintCard()
        {
            //Use Dictionary to convert the Royalty Cards 
            Dictionary<int, char> royalty = new Dictionary<int, char>();
            royalty.Add(11, 'J');
            royalty.Add(12, 'Q');
            royalty.Add(13, 'K');
            royalty.Add(14, 'A');
            if (royalty.ContainsKey(denomination))
            {
                Console.WriteLine(royalty[denomination] + " of " + suits);
            }
            else
            {
                Console.WriteLine(denomination + " of " + suits);
            }

        }

        //Single card Comparison
        public Card Winner(Card a, Card b)
        {
            Card winner = new Card();
            if (a.suits > b.suits) //compare suit first
            {
                winner.suits = a.suits;
                winner.denomination = a.denomination;
            }
            else if(a.suits == b.suits) { //compare denomination if suits are equal
                if(a.denomination > b.denomination)
                {
                    winner.suits = a.suits;
                    winner.denomination = a.denomination;
                }
                else
                {
                    winner.suits = b.suits;
                    winner.denomination = b.denomination;
                }
            }
            else
            {
                winner.suits = b.suits;
                winner.denomination = b.denomination;
            }
            return winner; // return the winner card
        }
    }

    class Hand : Card
    {
        // players will get their own hands
        public List<Card> cards { get; set; }
        public Hand()
        {
            cards = new List<Card>();
        }
        public int getNumCard()
        {
            return cards.Count();
        }
        // print out all cards on hand
        public virtual void printHand()
        {
            for (int i = 0; i < cards.Count(); i++)
            {
                cards[i].PrintCard();
            }
        }
    }

    class Player : Hand
    {
        string name{ get ; set ;}
        Hand newHand; // all players have a hand of card
        public Player(string playerName)
        {
            name = playerName;
            newHand = new Hand();
        }
        // draw a new random card and add it to hand
        public void draw(int time)
        {
            for (int i = 1; i <= time; i++)
            {
                Card randomCard = RandomCard();
                if (newHand.cards.Contains(randomCard))
                {
                    while (newHand.cards.Contains(randomCard))
                    {
                        randomCard = RandomCard();
                    }
                }
                newHand.cards.Add(randomCard);
            }

        }
        //discard a random card on hand
        public Card DiscardRandom()
        {
            Random rand = new Random();
            int index = rand.Next(newHand.cards.Count());
            Card randomCard = new Card();
            randomCard.suits = newHand.cards.ElementAt(index).suits;
            randomCard.denomination = newHand.cards.ElementAt(index).denomination;
            Console.Write(name + " has discarded: ");
            randomCard.PrintCard();
            newHand.cards.RemoveAt(index);
            return randomCard;
        }
        //print out the current hand
        public override void printHand()
        {
            Console.WriteLine(name + "'s Current Hand is: ");
            for (int i = 0; i < newHand.cards.Count(); i++)
            {
                newHand.cards[i].PrintCard();
            }
        }
    }
    
    class Program
    {
        static void Main(string[] args)
        {
            Player player1 = new Player("Amy"); // create a player called Amy
            player1.draw(5); // Amy draws 5 random card
            player1.printHand(); // print out Amy's current hand
            Console.WriteLine();
            Player player2 = new Player("John"); // create a player called John
            player2.draw(5); // John draws 5 random card
            player2.printHand(); // print out John's current hand
            Console.WriteLine();
            Card player1_discard = player1.DiscardRandom(); // Amy discards a random card from her hand
            Card player2_discard = player2.DiscardRandom(); // John discards a random card from his hand
            // Who wins?
            Card WinnerCard = new Card(); 
            WinnerCard = WinnerCard.Winner(player1_discard, player2_discard);
            Console.Write("Winner Card is: "); 
            WinnerCard.PrintCard();

        }
    }
}
