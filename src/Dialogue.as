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
                trust: {you: "Oh, biochemistry fascinates me too!", them: "It's great fun to poke ...stuff.", microexpression: "afraid"},
                doubt: {you: "You bonded with carbon and hydrogen?", them: "Yeah, and uh, oxygen, too.",
                        microexpression: "afraid"}
            },
            interest: {name: "Cooking", you: "How do you like cooking?", them: "I have this divine recipe for lamb!",
                microexpression: "joyful",
                trust: {you: "I know a bloody mary recipe for lamb!", them: "We could drink that with a steak!",
                    microexpression: "afraid"},
                doubt: {you: "I don't care for lamb, unless it's raw.", them: "Heh.  You are ... rare.",
                    microexpression: "afraid"}
            },
            all: {you: "I feel like I know our chemistry.", them: "Want dinner and see what heats up?",
                doubt: {you: "Holier than thous are not my type.", them: "I had a stake just for you...", health: 1.0},
                trust: {you: "Wanna cook me dinner?", them: "How about a stake... in your heart!", health: 0.0}
            }
        }
    }
}
