package
{
    /**
     * Portable.  Independent of Flash.
     */
    public class DateModel
    {
        internal var listens:Object = {};
        internal var state:String;
        internal var states:Object = {};
        internal var texts:Object = {};
        internal var topic:String;
        private var selected:String;
        private var dialogue:Object = Dialogue.tree;

        public function DateModel()
        {
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

        internal function update(deltaSeconds:Number):void
        {
            texts = {};
            states = {};
            listens = {};
            if (null == state)
            {
                texts.nameText = dialogue.name;
                texts.religionText = "Religion: " + dialogue.religion.name + "?";
                texts.professionText = "Profession: " + dialogue.profession.name + "?";
                texts.interestText = "Interest: " + dialogue.interest.name + "?";
                state = "menu";
                listen();
            }
            if (null != selected)
            {
                if ("menu" == state)
                {
                    topic = selected.split("Button")[0];
                    texts.youText = dialogue[topic].you;
                    texts.themText = dialogue[topic].them;
                    texts.doubtText = "Doubt";
                    texts.trustText = "Trust";
                    state = "ask";
                    listen();
                }
                else if ("ask" == state)
                {
                    var action:String = selected.split("Button")[0];
                    texts.youText = dialogue[topic][action].you;
                    texts.themText = dialogue[topic][action].them;
                    texts.doubtText = "Doubt";
                    texts.trustText = "Trust";
                    state = action;
                    listen();
                }
                else
                {
                    state = null;
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
