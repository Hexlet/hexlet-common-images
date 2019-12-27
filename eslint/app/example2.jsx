import React from 'react';

export default class MyComponent extends React.Component {
  static defaultProps = {
    title: 'title',
  };

  render() {
    const { title } = this.props;
    return title;
  }
}
