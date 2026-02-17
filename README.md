# vite-dnn-starter
A template for using Vite to develop DotNetNuke skins

## Usage

### Common steps (do this first)

1. Download this code using a tool like [`degit`](https://github.com/Rich-Harris/degit) or [fork this repository](https://github.com/6TELOIV/vite-dnn-starter/fork).
2. Install the dependencies with `npm i`

### Development

1. [Create a local DNN installation](https://dnncommunity.org/How-To/Download-and-Install)
2. Run the development server with `npm run dev`
3. Add a symlink to your DNN installation for the `.dnn` development skin folder

    ```
    mklink /D "C:/<path-to-dnn>/Portals/_default/Skins/MySkin/" "C:/<path-to-vite-dnn-starter>/.dnn"
    ```
4. Modify the `.dnn` folder permissions to allow access to your IIS user 
   - Usually this is `IIS AppPool\AppName`, and the user will be on your device, **not** an active directory, etc.
5. Configure a page/pages in DNN to use the skin, and start editing files to see the hot reloading in action

### Building

1. Run `npm run build`
2. The `dist` folder will contain the build and bundled skin, ready for use. You can follow the steps above to create a symlink to the skin, or you can copy the files to a DNN installation for production use
