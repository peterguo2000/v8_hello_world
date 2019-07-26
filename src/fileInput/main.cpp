#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fstream>
#include <iostream>
#include <sstream>
#include "libplatform/libplatform.h"
#include "v8.h"

using namespace v8;

void Print(const v8::FunctionCallbackInfo<v8::Value>& args);
void Quit(const v8::FunctionCallbackInfo<v8::Value>& args);
Isolate* isolate_;
Isolate* GetIsolate() { return isolate_; }

// Extracts a C string from a V8 Utf8Value.
const char* ToCString(const v8::String::Utf8Value& value) {
  return *value ? *value : "<string conversion failed>";
}

class Console;
Console* UnwrapConsoleObject(Handle<Object> jsObject );


class Console {
    public:
        Console() {}
		~Console() {}
	private:
	public:

};
//void Print(const v8::FunctionCallbackInfo<v8::Value>&
void log(const FunctionCallbackInfo<Value>& args){
	
	v8::String::Utf8Value str(GetIsolate(), args[0]);    
	const char* cstr = ToCString(str);     
	printf("%s\n", cstr);
}
void error(const FunctionCallbackInfo<Value>& args){
	v8::String::Utf8Value str(GetIsolate(), args[0]);
	const char* cstr = ToCString(str);
	fprintf(stderr,"%s\n", cstr);
}

Local<Object> WrapObject(Console *c) {

	EscapableHandleScope handle_scope(GetIsolate());

	Local<ObjectTemplate> class_t;
	Local<ObjectTemplate> raw_t = ObjectTemplate::New(GetIsolate());
        raw_t->SetInternalFieldCount(1);
        raw_t->Set(
		v8::String::NewFromUtf8(GetIsolate(), "log", v8::NewStringType::kNormal).ToLocalChecked(),
		v8::FunctionTemplate::New(GetIsolate(), log));
	raw_t->Set(
		v8::String::NewFromUtf8(GetIsolate(), "error", v8::NewStringType::kNormal).ToLocalChecked(),
		v8::FunctionTemplate::New(GetIsolate(), error));
	class_t = Local<ObjectTemplate>::New(GetIsolate(),raw_t);
        //create instance
        Local<Object> result = class_t->NewInstance(GetIsolate()->GetCurrentContext()).ToLocalChecked();
	//create wrapper
        Local<External> ptr = External::New(GetIsolate(),c);
	result->SetInternalField(0,ptr);
	return handle_scope.Escape(result);
}


int main(int argc, char* argv[]) {
  // Initialize V8.
  v8::V8::InitializeICUDefaultLocation(argv[0]);
  v8::V8::InitializeExternalStartupData(argv[0]);
  std::unique_ptr<v8::Platform> platform = v8::platform::NewDefaultPlatform();
  v8::V8::InitializePlatform(platform.get());
  v8::V8::Initialize();

  //get script from args
  //printf( "opening script %s \n",argv[1]);
  FILE* file = fopen(argv[1],"r");
  fseek(file, 0, SEEK_END);
  size_t size = ftell(file);
  rewind(file);
  char* fileScript = new char[size + 1];
  fileScript[size] = '\0';
  for (size_t i = 0; i < size;) {
    i += fread(&fileScript[i], 1, size - i, file);
    }
   fclose(file);
   
  //printf("running script %s\n",fileScript);
  
  // Create a new Isolate and make it the current one.
  Isolate::CreateParams create_params;
  create_params.array_buffer_allocator =
      v8::ArrayBuffer::Allocator::NewDefaultAllocator();
  Isolate* isolate = Isolate::New(create_params);
  {
    Isolate::Scope isolate_scope(isolate);
	  isolate_ = isolate;
    // Create a stack-allocated handle scope.
    HandleScope handle_scope(isolate);
    

    //create a template
    v8::Local<v8::ObjectTemplate> global = v8::ObjectTemplate::New(isolate);
    //use print
    global->Set(
      v8::String::NewFromUtf8(isolate, "quit", v8::NewStringType::kNormal)
          .ToLocalChecked(),
      v8::FunctionTemplate::New(isolate, Quit));
	   
    // Create a new context.
    Local<Context> context = Context::New(isolate,NULL,global);

    // Enter the context for compiling and running the hello world script.
    Context::Scope context_scope(context);
	
	//create js object
    Console* c = new Console();
    Local<Object> con = WrapObject(c);
	  context->Global()->Set(context,
		String::NewFromUtf8(isolate,"console",NewStringType::kNormal).ToLocalChecked(),
		con).FromJust();
     // Create a string containing the JavaScript source code.
    Local<String> source =
        String::NewFromUtf8(isolate, fileScript ,
                            NewStringType::kNormal).ToLocalChecked();


    // Compile the source code.
    Local<Script> script = Script::Compile(context, source).ToLocalChecked();

    // Run the script to get the result.
    Local<Value> result = script->Run(context).ToLocalChecked();

    // Convert the result to an UTF8 string and print it.
    String::Utf8Value utf8(GetIsolate(),result);
    //printf("%s\n", *utf8);

}
  // Dispose the isolate and tear down V8.
  isolate->Dispose();
  v8::V8::Dispose();

//  delete create_params.array_buffer_allocator;
  return 0;
}

void Print(const v8::FunctionCallbackInfo<v8::Value>& args) {
	printf("print called %i\n",args.Length()) ;
   bool first = true;
  for (int i = 0; i < args.Length(); i++) {
    v8::HandleScope handle_scope(args.GetIsolate());
    if (first) {
      first = false;
    } else {
      printf(" ");
    }
    v8::String::Utf8Value str(GetIsolate(), args[i]);
    const char* cstr = ToCString(str);
    printf("%s", cstr);
  }
  printf("\n");
  fflush(stdout);
}
void Quit(const v8::FunctionCallbackInfo<v8::Value>& args) {
	std::exit(0);
}
