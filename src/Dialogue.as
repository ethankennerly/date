package
{
    public class Dialogue
    {
        public static var tree:Object = {
            name:  "Abraham",
            religion: {name: "Atheist", you: "How did you become atheist?", them: "Simpler without ...uh... mythical creatures.",
                        microexpression: "afraid",
                trust: {you: "Science is simple. And priests are creeps!", them: "Heh...", microexpression: "afraid"}, 
                doubt: {you: "You: Faith is simpler than organic chemistry.", them: "Abraham: You're right! Life is mysterious.",
                    microexpression: "joyful"}
            },
            profession: {name: "Biologist", you: "How did you become a biologist?", them: "I like ...tinkering with the mystery of life.",
                trust: {you: "Oh, that sounds fun!", them: "It's great fun to poke things and stuff."},
                doubt: {you: "You bonded with carbon and hydrogen?", them: "Yeah, and uh, oxygen, too."}
            },
            interest: {name: "Cooking", you: "How do you like cooking?", them: "I have this divine recipe for lamb!",
                trust: {you: "Oh, I could sink my teeth into a lamb!", them: "I love lamb steak. Don't you?"},
                doubt: {you: "Lamb?  I prefer ... tender flesh.", them: "Ahem."}
            },
            all: {you: "I feel like I know our chemistry.", them: "Want dinner and see what heats up?",
                doubt: {you: "Holier than thous are not my type.", them: "I had a stake just for you..."},
                trust: {you: "Wanna cook me dinner?", them: "How about a stake... in your heart!"}
            }
        }
    }
}
