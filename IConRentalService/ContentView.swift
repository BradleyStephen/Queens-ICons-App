//
//  ContentView.swift
//  IConRentalService
//
//  Created by Bradley Stephen on 2022-03-26.
//
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore

   //end of AppView Model


//View Modifier for sing in page
struct FlatGlassView : ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .padding()
                .frame(height: 50)
                .background(.ultraThinMaterial)
                .cornerRadius(14)
        } else {
            // Fallback on earlier versions
            content
                .padding()
                .frame(height: 50)
                .cornerRadius(14)
        }
    }
}



struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @ObservedObject var model = ViewModel()
   
    
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    var body: some View {
    //Navigation link takes you to diffrent screens based on if statements/logic
        NavigationView{
        
           
            
        if viewModel.signedIn {
            
                
                RentView()
                
           
            .navigationTitle("Home")
            //.background()
            }
                
        
        else{
            SignInView()//takes user to signinview page
      }
    
    }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
            viewModel.fetchData()
        }
    
    }
       
    
}//end of content view



//Sign in View page
struct SignInView: View {
    @State var email = ""
    @State var password = ""
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    @ObservedObject var model = ViewModel()
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        ZStack{
            Image("QueensBackground")
            .resizable()
            .ignoresSafeArea()
        
        
            VStack{
                
                Image("LOGO")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 90)
                .cornerRadius(4)
                
                VStack  (spacing: 8)  {
                
                    TextField("Enter Email Address", text: $email)
                    .modifier(FlatGlassView())
                    .disableAutocorrection(true)//disabling features to debug probelm
                    .autocapitalization(.none)
                    .padding()
                    
                
                SecureField("Enter Password", text: $password)
                    .modifier(FlatGlassView())
                    .disableAutocorrection(true)//disabling features to debug probelm
                    .autocapitalization(.none)
                    .padding()
                 
                    
                }
                .padding()
                
                Divider().padding()
                
              
                Text("By signing up you accept the **Terms of Service** and **Privacy Policy**")
                .font(.footnote)
                .multilineTextAlignment(.center)
                
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signIn(email: email, password: password)
                    
                }, label: {
                    Text("Sign In")
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(.thickMaterial)
                        .cornerRadius(14)
                        .padding(.bottom, 8)
                        .foregroundColor(Color.blue)
                    
                })
                
                Text("Forgot password?")
                .foregroundColor(Color.red)
                .font(.caption)
                
                
                Divider().padding()
                
                Text("Dont have an account?")
                    .font(.caption)
                    
                
                
                NavigationLink("Sign Up!", destination: SignUpView())
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(.thickMaterial)
                .cornerRadius(14)
                .padding(.bottom, 8)
                .foregroundColor(Color.blue)
                    
                    
                    Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .foregroundColor(Color.primary.opacity(0.35))
            .foregroundStyle(.ultraThinMaterial)
            .cornerRadius(25)
            .padding()
            .navigationTitle("Sign In")
            //.background(skyBlue)
        
    }
            }
            

        }
//end of sininView


//Sign up view page
struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    @ObservedObject var model = ViewModel()
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
       
        ZStack{
            Image("QueensBackground")
            .resizable()
            .ignoresSafeArea()
        
        
        VStack{
            
            Image("LOGO")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            VStack{
                
                TextField("Enter Email Address", text: $email)
                    .modifier(FlatGlassView())
                    .disableAutocorrection(true)//disabling features to debug probelm
                    .autocapitalization(.none)
                    .padding()
                
                SecureField("Enter Password", text: $password)
                    .modifier(FlatGlassView())
                    .disableAutocorrection(true)//disabling features to debug probelm
                    .autocapitalization(.none)
                    .padding()
                
                
                Divider().padding()
                
                Text("By signing up you accept the **Terms of Service** and **Privacy Policy**")
                    .font(.footnote)
                
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signUp(email: email, password: password)
                    
                    
                }, label: {
                    Text("Create Account")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.thickMaterial)
                    .cornerRadius(14)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.blue)
                    
                })
                
            }
            .padding()
            
            
            Spacer()
        }
        .background(.ultraThinMaterial)
        .foregroundColor(Color.primary.opacity(0.35))
        .foregroundStyle(.ultraThinMaterial)
        .cornerRadius(25)
        .padding()
    }
        .navigationTitle("Create Account")
        .background(skyBlue)
        
    }
}
//end of sing up page


//Rnetal Page View
struct RentView: View {
    
    
    @StateObject var HomeModel = ViewModel()
    
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
  
    var body: some View {
        
        ZStack{
        
            VStack(spacing: 10) {
                
                Text("Welcome back Bradley!")
                    .font(.title2)
                    .padding(.vertical,20)
                    .padding(.horizontal)
            
            Button(action: {
                withAnimation(.easeIn){HomeModel.showMenu.toggle()}
            }, label: {
                
                Image(systemName: "line.horizontal.3")
                    .font(.title)
                    .foregroundColor(Color.red)
                
            })
            
            Divider()
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            VStack(spacing: 30){
                
                ForEach(HomeModel.items) { item in
                    
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                        
                        ItemView(item: item)
                        
                        HStack{
                            
                            
                            
                            Text( "In Stock: \(item.item_available)" )
                                .padding(.vertical,10)
                                .padding(.horizontal,10)
                                .foregroundColor(.white)
                                .background(Color.green)
                                .clipShape(Capsule())
                                
                            
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                self.HomeModel.addToCart(item: item)
                            }, label: {
                                
                                Image(systemName: item.isAdded ? "checkmark" : "plus")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(item.isAdded ? Color.green : Color.pink)
                                    .clipShape(Circle())
                            })
                           

                        
                           }
                        .padding(.trailing,10)
                        .padding(.top,10)
                    })
                           }
                           }
                    })
                    .frame(width: UIScreen.main.bounds.width - 30)
                        
    
        }//end of vstack
    
        HStack{
            
            Menu(homeData: HomeModel)
            //
                .offset(x: HomeModel.showMenu ? 0 : -UIScreen.main.bounds.width
                        / 1.6)
           
            Spacer(minLength: 0)
            
        }
        .background(
            Color.black.opacity(HomeModel.showMenu ? 0.3 : 0).ignoresSafeArea()
            //closing when tap outside
                .onTapGesture(perform: {
                    withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                })
        )
            
        
        }
        .navigationTitle("Home")
        .onAppear{
            
           HomeModel.fetchData()
            
        }
        
    }//end of body
        
        
    }//end of view
    
   
   








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
     
    }
}

//
