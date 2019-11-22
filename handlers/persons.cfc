/**
* I am a new handler
*/
component{
	
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};
	// Inject our service layer
	property name="personService" inject="entityService:Person";
	/**
	IMPLICIT FUNCTIONS: Uncomment to use
	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/
		
	/**
	* index
	*/
	function index( event, rc, prc ){
		event.setView( "persons/index" );
	}

	/**
	* create
	*/
	function create( event, rc, prc ){
		prc.person = personService
			.new( {
				name     : "Luis",
				age     : 40,
				lastVisit : now()
			} );
		;
		return personService
			.save( prc.person )
			.getMemento( includes="id" );
	}

	/**
	* show
	*/
	function show( event, rc, prc ){
		event.setView( "persons/show" );
	}

	/**
	* update
	*/
	function update( event, rc, prc ){
		event.setView( "persons/update" );
	}

	/**
	* delete
	*/
	function delete( event, rc, prc ){
		event.setView( "persons/delete" );
	}


	
}
