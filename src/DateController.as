package
{
    /**
     * Portable.  Independent of Flash.
     */
    public class DateController
    {
        private var model:DateModel;
        private var view:*;

        public function DateController(aView:*)
        {
            this.model = new DateModel();
            this.view = aView;
        }

        internal function update(deltaSeconds:Number):void
        {
            model.update(deltaSeconds);
            View.setState(view, model.state);
            Controller.setStates(view, model.texts, View.setText);
            Controller.setStates(view, model.listens, View.listen, this);
            View.setScaleX(view.healthMeterFill, model.health);
            View.setState(view.microexpression, model.microexpression);
        }

        public function select(event:*):void
        {
            var target:* = View.currentTarget(event);
            model.select(View.getName(target));
        }
    }
}
