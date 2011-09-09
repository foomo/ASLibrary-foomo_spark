/*
 * This file is part of the foomo Opensource Framework.
 *
 * The foomo Opensource Framework is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License as
 * published  by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * The foomo Opensource Framework is distributed in the hope that it will
 * be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along with
 * the foomo Opensource Framework. If not, see <http://www.gnu.org/licenses/>.
 */
package org.foomo.spark.containers
{
	import flash.events.MouseEvent;

	import spark.components.Button;Button;
	import spark.components.Panel;

	[SkinState("collapsed")]

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 * @see 	http://www.iwobanas.com/2009/09/creating-collapsible-panel-in-flex-4/
	 */
	public class CollapsiblePanel extends Panel
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *  The skin part that defines the appearance of the
		 *  button responsible for collapsing/uncollapsing the panel.
		 */
		[SkinPart(required="false")]
		public var collapseButton:Button;

		/**
		 * @private
		 * storage variable for <code>collapsed</code>property.
		 * Add collapeButton click listener.
		 */
		protected var _collapsed:Boolean;

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Flag indicating whether this panel is collapsed (minimized) or not.
		 */
		public function get collapsed():Boolean
		{
			return this._collapsed;
		}
		/**
		 * @private
		 */
		public function set collapsed(value:Boolean):void
		{
			this._collapsed = value;
			this.invalidateSkinState();
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);

			if (instance == collapseButton) Button(instance).addEventListener(MouseEvent.CLICK, this.collapseButton_clickHandler);
		}

		/**
		 * @private
		 * Remove collapeButton click listener.
		 */
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			if (instance == collapseButton) Button(instance).removeEventListener(MouseEvent.CLICK, this.collapseButton_clickHandler);

			super.partRemoved(partName, instance);
		}

		/**
		 *  @private
		 */
		override protected function getCurrentSkinState():String
		{
			return (this.collapsed) ? "collapsed" : super.getCurrentSkinState();
		}

		//-----------------------------------------------------------------------------------------
		// ~ Protected eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 * @private
		 * Toggle collapsed state on collapseButton click event.
		 */
		protected function collapseButton_clickHandler(event:MouseEvent):void
		{
			this.collapsed = !this.collapsed;
		}
	}
}