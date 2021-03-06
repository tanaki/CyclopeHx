#include <hxcpp.h>

#ifndef INCLUDED_native_display3D_textures_TextureBase
#include <native/display3D/textures/TextureBase.h>
#endif
#ifndef INCLUDED_native_events_EventDispatcher
#include <native/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_native_events_IEventDispatcher
#include <native/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_native_gl_GL
#include <native/gl/GL.h>
#endif
#ifndef INCLUDED_native_gl_Object
#include <native/gl/Object.h>
#endif
#ifndef INCLUDED_native_gl_Texture
#include <native/gl/Texture.h>
#endif
namespace native{
namespace display3D{
namespace textures{

Void TextureBase_obj::__construct(::native::gl::Texture glTexture)
{
HX_STACK_PUSH("TextureBase::new","native/display3D/textures/TextureBase.hx",17);
{
	HX_STACK_LINE(19)
	super::__construct(null());
	HX_STACK_LINE(21)
	this->glTexture = glTexture;
}
;
	return null();
}

TextureBase_obj::~TextureBase_obj() { }

Dynamic TextureBase_obj::__CreateEmpty() { return  new TextureBase_obj; }
hx::ObjectPtr< TextureBase_obj > TextureBase_obj::__new(::native::gl::Texture glTexture)
{  hx::ObjectPtr< TextureBase_obj > result = new TextureBase_obj();
	result->__construct(glTexture);
	return result;}

Dynamic TextureBase_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< TextureBase_obj > result = new TextureBase_obj();
	result->__construct(inArgs[0]);
	return result;}

Void TextureBase_obj::dispose( ){
{
		HX_STACK_PUSH("TextureBase::dispose","native/display3D/textures/TextureBase.hx",26);
		HX_STACK_THIS(this);
		HX_STACK_LINE(26)
		::native::gl::GL_obj::deleteTexture(this->glTexture);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(TextureBase_obj,dispose,(void))


TextureBase_obj::TextureBase_obj()
{
}

void TextureBase_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(TextureBase);
	HX_MARK_MEMBER_NAME(glTexture,"glTexture");
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void TextureBase_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(glTexture,"glTexture");
	super::__Visit(HX_VISIT_ARG);
}

Dynamic TextureBase_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"dispose") ) { return dispose_dyn(); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"glTexture") ) { return glTexture; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic TextureBase_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 9:
		if (HX_FIELD_EQ(inName,"glTexture") ) { glTexture=inValue.Cast< ::native::gl::Texture >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void TextureBase_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("glTexture"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("dispose"),
	HX_CSTRING("glTexture"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(TextureBase_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(TextureBase_obj::__mClass,"__mClass");
};

Class TextureBase_obj::__mClass;

void TextureBase_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("native.display3D.textures.TextureBase"), hx::TCanCast< TextureBase_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void TextureBase_obj::__boot()
{
}

} // end namespace native
} // end namespace display3D
} // end namespace textures
