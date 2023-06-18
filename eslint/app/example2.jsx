export default class MyComponent extends React.Component {
  static defaultProps = {
    title: 'title',
  };

  render() {
    const { title } = this.props;
    console.log(title);
    return title;
  }
}
