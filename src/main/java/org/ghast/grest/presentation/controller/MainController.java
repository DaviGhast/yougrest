package org.ghast.grest.presentation.controller;

public class MainController {
	
	private static ZeusHybridViewController zeusHybridViewController = null;

	public ZeusHybridViewController getHybridViewController() {
		
		if (zeusHybridViewController == null) {
			
			zeusHybridViewController = new ZeusHybridViewController();
			
		}
		
		return zeusHybridViewController;
		
	}

}
