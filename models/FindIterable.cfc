/**
*
* @author pjacekm@gmail.com
* @description 
*
*/

component output="false" extends="MongoIterable" accessors="true" {

	/**
	* Sets the number of documents to return per batch
	*/
	public FindIterable function batchSize(required numeric batchSize){
		getMongoIterable().batchSize(
			javacast("int", arguments.batchSize)
		);
		return this;
	}



	/**
	 * Sets the collation options 
	 *
	 * @collation 
	 */
	public FindIterable function collation(required Collation collation) {
		getMongoIterable().collation(
			arguments.collation.build()
		);
		return this;
	}



	/**
	* Sets the comment to the query
	*/
	public FindIterable function comment(required string comment) {
		getMongoIterable().comment(
			javacast("string", arguments.comment)
		);
		return this;
	}




	public FindIterable function filter(required Document filter) {
		getMongoIterable().filter(
			getUtil().toMongo(arguments.filter)
		);
		return this;
	}



	/**
	* Sets the maximum amount of time for the server to wait on new documents to satisfy a tailable cursor query.
	* @timeUnit literal constant name, as described in https://docs.oracle.com/javase/7/docs/api/java/util/concurrent/TimeUnit.html?is-external=true
	*/
	public FindIterable function maxAwaitTime(required numeric maxAwaitTime, required string timeUnit) {
		var tuObj=getJavaFactory().getJavaObject("java.util.concurrent.TimeUnit");
		var tu=tuObj[uCase(arguments.timeUnit)];
		getMongoIterable().maxAwaitTime(javacast("long", arguments.maxAwaitTime), tu);
		return this;
	}



	/**
	* Sets the maximum execution time on the server for this operation.
	* @timeUnit literal constant name, as described in https://docs.oracle.com/javase/7/docs/api/java/util/concurrent/TimeUnit.html?is-external=true
	*/
	public FindIterable function maxTime(required numeric maxTime, required string timeUnit) {
		var tuObj=getJavaFactory().getJavaObject("java.util.concurrent.TimeUnit");
		var tu=tuObj[uCase(arguments.timeUnit)];
		getMongoIterable().maxTime(javacast("long", arguments.maxTime), tu);
		return this;
	}




	public FindIterable function noCursorTimeout(required boolean noCursorTimeout) {
		getMongoIterable().noCursorTimeout(javacast("boolean", arguments.noCursorTimeout));
		return this;
	}




	public FindIterable function partial(required boolean partial) {
		getMongoIterable().partial(javacast("boolean", arguments.partial));
		return this;
	}




	public FindIterable function limit(required numeric limit) {
		getMongoIterable().limit(javacast("int", arguments.limit));
		return this;
	}




	public FindIterable function skip(required numeric skip) {
		getMongoIterable().skip(javacast("int", arguments.skip));
		return this;
	}




	public FindIterable function sort(required Document sort) {
		getMongoIterable().sort(
			arguments.sort.getMongoDocument()
		);
		return this;
	}




	public FindIterable function projection(required Document projection) {
		getMongoIterable().projection( 
			arguments.projection.getMongoDocument()
		);
		return this;
	}
}
