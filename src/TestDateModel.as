package
{
    public class TestDateModel
    {
        public function TestDateModel()
        {
            testValidateDialogue();
        }

        private function testValidateDialogue():void
        {
            var dialogue:Object = Dialogue.tree;
            var speakers:Object = {"you": true, "them": true};
            var actions:Object = {"doubt": true, "trust": true};
            var topics:Object = {"religion": true, "profession": true, "interest": true};
            for (var topic:String in topics)
            {
                for (var speaker:String in speakers)
                {
                    if (!(dialogue[topic][speaker] is String))
                    {
                        throw new Error("Expected " + topic + " speaker " + speaker + " is a string." );
                    }
                }
                for (var action:String in actions)
                {
                    if (!(dialogue[topic][action] is Object))
                    {
                        throw new Error("Expected " + topic + " action " + action + " is an object." );
                        for (speaker in speakers)
                        {
                            if (!(dialogue[topic][action][speaker] is String))
                            {
                                throw new Error("Expected " + topic + " speaker " + speaker + " is a string." );
                            }
                        }
                    }
                }
            }
        }
    }
}
