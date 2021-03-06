package
{
    /**
     * Portable.  Independent of Flash.
     */
    public class DateModel
    {
        /**
         * @return  If any true value.
         */
        public static function isAnyTrue(container:*):Boolean
        {
            for (var key:String in container)
            {
                if (container[key])
                {
                    return true;
                }
            }
            return false;
        }

        internal var microexpression:String;
        internal var listens:Object = {};
        internal var state:String;
        internal var states:Object = {};
        internal var texts:Object = {};
        internal var topic:String;
        internal var topics:Object;
        internal var health:Number = 1.0;
        internal var perSecond:Number = 1.0 / 60.0;
        private var action:String;
        private var context:Object;
        private var selected:String;
        private var dialogue:Object = Dialogue.tree;

        public function DateModel()
        {
            initTopics();
            new TestDateModel();
        }

        private function initTopics():void
        {
            topics = {};
            topics.religion = true;
            topics.profession = true;
            topics.interest = true;
            state = "start";
        }

        internal function listen():void
        {
            listens = {
                religionButton: "select",
                professionButton: "select",
                interestButton: "select",
                doubtButton: "select",
                trustButton: "select"
            }
        }

        private function ask(topic:String):void
        {
            context = dialogue[topic];
            texts.youText = context.you;
            texts.themText = context.them;
            texts.doubtText = "Doubt";
            texts.trustText = "Trust";
            microexpression = context.microexpression;
            state = "ask";
            listen();
        }

        internal function update(deltaSeconds:Number, previousState:String):void
        {
            microexpression = null;
            texts = {};
            states = {};
            listens = {};
            if (state != "start") 
            {
                health = Math.max(0.0, Math.min(1.0, health - deltaSeconds * perSecond));
            }
            if (state == "start" && previousState == "menu")
            {
                texts.nameText = dialogue.name;
                texts.religionText = "Religion: " + dialogue.religion.name + "?";
                texts.professionText = "Profession: " + dialogue.profession.name + "?";
                texts.interestText = "Interest: " + dialogue.interest.name + "?";
                listen();
                state = "menu";
            }
            if (null != selected)
            {
                if ("menu" == state)
                {
                    topic = selected.split("Button")[0];
                    ask(topic);
                }
                else if ("ask" == state)
                {
                    action = selected.split("Button")[0];
                    context = dialogue[topic][action];
                    texts.youText = context.you;
                    texts.themText = context.them;
                    texts.doubtText = "Doubt";
                    texts.trustText = "Trust";
                    if (topics[topic] && "health" in context)
                    {
                        health += context.health;
                    }
                    topics[topic] = false;
                    microexpression = context.microexpression;
                    state = action;
                    listen();
                }
                else
                {
                    if (topic == "all")
                    {
                        initTopics();
                        state = "start";
                    }
                    if (isAnyTrue(topics))
                    {
                        state = "menu";
                    }
                    else
                    {
                        state = "ask";
                        topic = "all";
                        ask(topic);
                    }
                }
                selected = null;
            }
        }

        public function select(name:String):void
        {
            selected = name;
        }
    }
}
