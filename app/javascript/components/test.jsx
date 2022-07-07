import React from "react";
import ReactDOM from "react-dom/client";

class TestReact extends React.Component {
    render() {
        return (
            <div> Rendered in react </div>
        )

    }
}

const testingIfWorks = ReactDOM.createRoot(document.getElementById("test-react-container"));
testingIfWorks.render(<TestReact />);
