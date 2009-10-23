package com.factorylabs.orange.core.reflection
{
	import com.factorylabs.orange.core.collections.Map;	import com.factorylabs.orange.core.util.Convert;		import flash.utils.describeType;	import flash.utils.getDefinitionByName;	import flash.utils.getQualifiedClassName;	import flash.utils.getQualifiedSuperclassName;	
	/**
	 * Class for reflecting on a type. Most info is lazy loaded in hopes of
	 * helping performance. Some code gleaned from the prana IoC codebase.
	 */ 
	public final class TypeInfo
	{
		private var _isDynamic:Boolean;
		private var _isFinal:Boolean;
		private var _isStatic:Boolean;
		private var _constructorInfo:ConstructorInfo;
		private var _type:Class;
		private var _baseClass:TypeInfo;
		private var _description:XML;
		private var _members:Map;
		
		
		//lazy loaded
		private var _methods:Map;
		private var _accessors:Map;
		private var _constants:Map;
		private var _variables:Map;
		private var _interfaces:Array;
		
		public function get type():Class { return _type; }
		public function get constructorInfo():ConstructorInfo { return _constructorInfo; }
		public function get isDynamic():Boolean { return _isDynamic; }
		public function get isFinal():Boolean { return _isFinal; }
		public function get isStatic():Boolean { return _isStatic; }
		
		/**
		 * Creates a new <code>TypeInfo</code> instance.
		 */
		public function TypeInfo(type:Class) 
		{		
			//TODO: should we hold this in memory or retrieve it every time we need to access
			//info about the type?
			_description = describeType(type);
			
			_type = type;
			setClassProperties();
		}
		
		/**
		 * Sets type level descriptions and constructor info
		 */
		private function setClassProperties():void
		{
			_isDynamic = Convert.toBool(_description.@isDynamic.toString());
			_isFinal = Convert.toBool(_description.@isFinal.toString());
			_isStatic = Convert.toBool(_description.@isStatic.toString());
			setConstructorInfo();
		}
		
		/**
		 * Set the constructor info from the description xml.
		 */
		private function setConstructorInfo():void
		{
			_constructorInfo = TypeDescriptionXmlParser.parseConstructor(_description);
		}
		
		private function ensureMemberMap():void
		{
			if(_members == null)
		 	{
		 		//verify everything is parsed.
		 		getVariables();
		 		getConstants();
		 		getAccessors();
		 		getMethods();
		 		//build lookup
		 		_members = _variables;
			 	_members.extend(_constants);
			 	_members.extend(_accessors);
			 	_members.extend(_methods);
		 	}
		}
		
		/**
		 * Returns a <code>TypeInfo</code> of the base class for a class.
		 */
		public function getBaseClass():TypeInfo
		{
			if(_baseClass == null)
			{
				var name:String = getQualifiedSuperclassName(type);
				if(name != null)
					_baseClass = TypeInfo.getByName(name);
			}	
			return _baseClass;
		}
		
		/**
		 * Returns a <code>Array</code> of the interfaces (as TypeInfo) for a class.
		 *  - description xml is parsed lazily
		 */
		public function getInterfaces():Array
		{
			if(_interfaces == null)
				_interfaces = TypeDescriptionXmlParser.parseInterfaces(_description);
			return _interfaces;
		}
		
		/**
		 * Returns a <code>Array</code> of the public variables for a class.
		 *  - description xml is parsed lazily
		 */
		public function getVariables():Array
		{
			if(_variables == null)
				_variables = TypeDescriptionXmlParser.parseVariables(_description);
			return _variables.values;
		}
		
		/**
		 * Returns a <code>Array</code> of the accessors (getters and setters) for a class.
		 *  - description xml is parsed lazily
		 */
		public function getAccessors():Array
		{
			if(_accessors == null)
				_accessors = TypeDescriptionXmlParser.parseAccessors( _description);
			return _accessors.values;
		}
		
		/**
		 * Returns a <code>Array</code> of the constants for a class.
		 *  - description xml is parsed lazily
		 */
		public function getConstants():Array
		{
			if(_constants == null)
				_constants = TypeDescriptionXmlParser.parseConstants(_description);
			return _constants.values;
		}
		
		/**
		 * Returns a <code>Array</code> of the methods for a class.
		 *  - description xml is parsed lazily
		 */
		public function getMethods():Array
		{
			if(_methods == null)
				_methods = TypeDescriptionXmlParser.parseMethods(_description);
			return _methods.values;
		}
		
		/**
		 * Returns a <code>IMemberInfo</code> from a name on the class.
		 * 
		 * @params name a string that represents the name of the member.
		 */
		 public function findMember(name:String):IMemberInfo
		 {
		 	ensureMemberMap();
		 	
		 	if(_members.hasKey(name))
		 		return _members.get(name);
		 	else
		 		return null;
		 }
		
		/**
		 * Returns a <code>Boolean</code> if class implements interface.
		 *  - description xml is parsed lazily
		 * 
		 * @param interfaceType a type representing the interface
		 */
		public function definesInterface(interfaceType:Class):Boolean
		{
			return TypeDescriptionXmlParser.findInterface(_description, getQualifiedClassName(interfaceType)) != null;
		}
		
		/**
		 * Returns a <code>TypeInfo</code> object that describes the given instance.
		 * 
		 * @param instance the instance from which to get a type description
		 */
		public static function getByInstance(instance:*):TypeInfo 
		{
			var result:TypeInfo;
			var type:Class = getClassFromInstance(instance);
			
			if (type != null)
				result = TypeInfo.getByClass(type);

			return result;
		}
		
		/**
		 * Returns a <code>Class</code> object that of a given instance
		 * 
		 * @param instance the instance from which to get a Class object.
		 */
		public static function getClassFromInstance(instance:*):Class
		{
			return getDefinitionByName(getQualifiedClassName(instance)) as Class;
		}
		
		/**
		 * Returns a <code>TypeInfo</code> object that describes the given classname.
		 * 
		 * @param name the classname from which to get a type description
		 */
		public static function getByName(name:String):TypeInfo 
		{
			var type:Class;
			// TODO: look into this, maybe create an UntypedType class
			if ("*" == name) 
				return null;
			else 
				type = getDefinitionByName(name) as Class;
				
			return TypeInfo.getByClass(type);
		}
		
		/**
		 * Returns a <code>TypeInfo</code> object that describes the given class.
		 * 
		 * @param type the class from which to get a type description
		 */
		public static function getByClass(type:Class):TypeInfo 
		{
			var result:TypeInfo = new TypeInfo(type);
			return result;
		}
	}
}
import com.factorylabs.orange.core.collections.Map;import com.factorylabs.orange.core.reflection.*;import com.factorylabs.orange.core.util.Convert;import com.factorylabs.orange.core.util.StringUtil;
/**
 * Internal xml parser
 *  - taken from prana IoC framework.
 */
class TypeDescriptionXmlParser 
{
	public static function findInterface(xml:XML,interfaceName:String):String
	{
		var name:String;
		name = xml[ 'factory' ].implementsInterface.(@type == interfaceName).@type;
		if(StringUtil.isEmpty(name)) name = null;
		return name;
	}
	
	public static function parseInterfaces(xml:XML):Array 
	{
		var result:Array = [];
		for each(var interfaceXml:XML in xml[ 'factory' ].implementsInterface) 
		{
			var info:TypeInfo = TypeInfo.getByName(interfaceXml.@type);
			result.push(info);
		}
		return result;
	}
	
	public static function parseMethods(xml:XML):Map 
	{
		var classMethods:Map = parseMethodsByModifier( xml[ 'method' ], true );
		var instanceMethods:Map = parseMethodsByModifier( xml[ 'factory' ].method, false );
		return Map(classMethods.extend( instanceMethods ));
	}
	
	public static function parseAccessors(xml:XML):Map 
	{
		var classAccessors:Map = parseAccessorsByModifier( xml[ 'accessor' ], true);
		var instanceAccessors:Map = parseAccessorsByModifier( xml[ 'factory' ].accessor, false);
		return Map(classAccessors.extend(instanceAccessors));
	}
	
	public static function parseConstants(xml:XML):Map 
	{
		var classConstants:Map = parseConstantsByModifier(xml[ 'constant' ], true);
		var instanceConstants:Map = parseConstantsByModifier(xml[ 'factory' ].constant, false);
		return Map(classConstants.extend(instanceConstants));
	}
	
	public static function parseVariables(xml:XML):Map 
	{
		var classVariables:Map = parseVariablesByModifier(xml[ 'variable' ], true);
		var instanceVariables:Map = parseVariablesByModifier(xml[ 'factory' ].variable, false);
		return Map(classVariables.extend(instanceVariables));
	}
	
	public static function parseMembers(members:XMLList, isStatic:Boolean):Map 
	{
		var result:Map = new Map(true);
		for each (var m:XML in members) 
		{
			var member:IMemberInfo = IMemberInfo(new MemberInfo(m.@name, TypeInfo.getByName(m.@type), isStatic));
			result.add(member.name,member);
		}
		return result;
	}
	
	public static function parseConstructor(xml:XML):ConstructorInfo 
	{
		var params:Array = [];
		for each(var paramXML:XML in xml[ 'factory' ].constructor.parameter) 
		{
			var paramType:TypeInfo = TypeInfo.getByName(paramXML.@type);
			var param:Parameter = new Parameter(paramXML.@index, paramType, Convert.toBool(paramXML.@optional.toString()));
			params.push(param);
		}
		var info:ConstructorInfo = new ConstructorInfo(params);
		return info;
	}
	
	private static function parseConstantsByModifier(constantsXML:XMLList, isStatic:Boolean):Map 
	{
		var result:Map = new Map(true);
		for each (var m:XML in constantsXML) 
		{
			var constant:Constant = new Constant(m.@name, TypeInfo.getByName(m.@type), isStatic);
			result.add(constant.name,constant);
		}
		return result;
	}
	
	private static function parseVariablesByModifier(variablesXML:XMLList, isStatic:Boolean):Map 
	{
		var result:Map = new Map(true);
		for each (var m:XML in variablesXML) 
		{
			var variable:Variable = new Variable(m.@name, TypeInfo.getByName(m.@type), isStatic);
			result.add(variable.name,variable);
		}
		return result;
	}
	
	private static function parseMethodsByModifier(methodsXML:XMLList, isStatic:Boolean):Map 
	{
		var result:Map = new Map(true);
		for each (var methodXML:XML in methodsXML) 
		{
			var params:Array = [];
			for each(var paramXML:XML in methodXML[ 'parameter' ] ) 
			{
				var paramType:TypeInfo = TypeInfo.getByName(paramXML.@type);
				var param:Parameter = new Parameter(paramXML.@index, paramType, Convert.toBool(paramXML.@optional.toString()));
				params.push(param);
			}
			var returnType:TypeInfo = (methodXML.@returnType == "void")? null : TypeInfo.getByName(methodXML.@returnType);
			var method:Method = new Method(TypeInfo.getByName(methodXML.@declaredBy), 
										   methodXML.@name, 
										   isStatic, 
										   params, 
										   returnType);
			
			result.add(method.name,method);
		}
		return result;
	}
	private static function parseAccessorsByModifier(accessorsXML:XMLList, isStatic:Boolean):Map 
	{
		var result:Map = new Map(true);
		for each (var accessorXML:XML in accessorsXML) 
		{
			var accessor:Accessor = new Accessor(
										accessorXML.@name,
										AccessorAccess.fromString(accessorXML.@access),
										TypeInfo.getByName(accessorXML.@type),
										isStatic,
										TypeInfo.getByName(accessorXML.@declaredBy));
			result.add(accessor.name,accessor);
		}
		return result;
	}
}