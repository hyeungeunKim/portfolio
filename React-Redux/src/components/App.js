import React, { Component } from 'react';
import PropTypes from 'prop-types';
import Counter from './Counter';

const propTypes = {

};
const defaultProps = {

};

class App extends Component {
    constructor(props) {
        super(props);
    }
    render() {
        return(
            <Counter/>
        );
    }
}

App.propTypes = propTypes;
App.defaultProps = defaultProps;

export default App;